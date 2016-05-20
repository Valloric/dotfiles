(declare to-json)
(defn- json-property
  ([name value column] [:property (str name) (to-json value column)])
  ([column row]        [:property (.name column) (to-json (.value row column) column)]))
(defn- json-object
  ([pairs column]      [:object (map (fn [[n v]] (json-property n v column)) pairs)])
  ([row]               [:object (map #(json-property % row) COLUMNS)]))
(defn- json-array
  ([elements column]   [:array (map #(to-json % column) elements)])
  ([rows]              [:array (map json-object rows)]))
(defn- to-json [value column]
  (cond
    (nil? value)                    [:nil]
    (or (number? value)
        (instance? Boolean value))  [:value value column]
    (instance? java.util.Map value) (json-object (seq value) column)
    (.isArray (.getClass value))    (json-array (seq value) column)
    :else                           [:string value column]))

(defn- format [value column] (.formatValue FORMATTER value column))
(defn- escape-chars [v]      (com.intellij.openapi.util.text.StringUtil/escapeStringCharacters v))
(defn- output [& strings]    (doseq [s (flatten strings)] (.append OUT s)))
(defn- output-indent [level] (output (repeat level "  ")))

(defn- output-json [[type & args] level]
  (case type
    :nil      (output "null")
    :plain    (let [[text] args]   (output text))
    :value    (let [[v c] args]    (output (format v c)))
    :string   (let [[v c] args]    (output "\"" (escape-chars (format v c)) "\""))
    :property (let [[n v] args]    (output "\"" (escape-chars n) "\": ") (output-json v level))
    :object   (let [[props] args]  (output-json [:nested "{" props "}"] level))
    :array    (let [[values] args] (output-json [:nested "[" values "]"] level))
    :nested   (let [[lpar values rpar] args]
                (output lpar)
                (when (seq values)
                  (output "\n")
                  (doseq [v (interpose [:plain ",\n"] values)]
                    (when-not (= :plain (first v))
                      (output-indent (inc level)))
                    (output-json v (inc level)))
                  (output "\n")
                  (output-indent level))
                (output rpar))))

(output-json (json-array ROWS) 0)