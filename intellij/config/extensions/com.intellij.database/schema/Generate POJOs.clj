(def package "com.my.db")
(def default-type "String")
(def type-mappings
    [
        [["int"] "Long"]
        [["float" "double" "decimal" "real"] "Double"]
        [["datetime" "timestamp"] "java.sql.Timestamp"]
        [["date"] "java.sql.Date"]
        [["time"] "java.sql.Time"]
    ])


(defn- first-to-lower-case [name]
    (if (< (count name) 2) (.toLowerCase name) (str (.toLowerCase (subs name 0 1)) (subs name 1))))
(defn- java-name [name]
    (apply str (map clojure.string/capitalize (re-seq #"\w+" name))))
(defn- java-type [data-type]
    (let [spec             (.. data-type getSpecification toLowerCase)
          spec-matches?    (fn [pattern] (.contains spec pattern))
          mapping-matches? (fn [[ps t]] (when (some spec-matches? ps) t))
          type             (some mapping-matches? type-mappings)]
        (or type default-type)))
(defn- field-infos [table]
    (let [columns    (com.intellij.database.util.DasUtil/getColumns table)
          field-info (fn [column] {:name (java-name (.getName column))
                                   :type (java-type (.getDataType column))})]
        (map field-info columns)))
(defn- field-text [field-info]
    (let [type (:type field-info)
          fname (first-to-lower-case (:name field-info))]
        (str "  private " type " " fname ";\n")))
(defn- getter-text [field-info]
    (let [type  (:type field-info)
          name  (:name field-info)
          fname (first-to-lower-case name)]
        (str "  public " type " get" name "() {\n"
             "    return " fname ";\n"
             "  }\n")))
(defn- setter-text [field-info]
    (let [type  (:type field-info)
          name  (:name field-info)
          fname (first-to-lower-case name)]
        (str "  public void set" name "(" type " " fname ") {\n"
             "    this." fname " = " fname ";\n"
             "  }\n")))
(defn- pojo-text [class-name fields]
    (apply str (flatten
        ["package " package ";\n\n"
         "public class " class-name " {\n"
         (map field-text fields)
         "\n"
         (interpose "\n" (interleave (map getter-text fields)
                                     (map setter-text fields)))
         "}\n"])))


(defn- generate-pojo [directory table]
    (let [class-name (java-name (.getName table))
          fields     (field-infos table)
          file       (java.io.File. directory (str class-name ".java"))
          text       (pojo-text class-name fields)]
        (com.intellij.openapi.util.io.FileUtil/writeToFile file text)))
(defn- generate-pojos [directory]
    (let [table? (partial instance? com.intellij.database.model.DasTable)]
        (doseq [table (filter table? SELECTION)]
            (generate-pojo directory table))))


(.chooseDirectoryAndSave FILES
                         "Choose directory"
                         "Choose where to generate POJOs to"
                         (proxy [com.intellij.util.Consumer] []
                            (consume [directory]
                                (generate-pojos directory)
                                (.refresh FILES directory))))