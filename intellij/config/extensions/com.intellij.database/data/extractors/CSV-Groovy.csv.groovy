SEPARATOR = ","
QUOTE     = "\""
NEWLINE   = System.getProperty("line.separator")

def record(values, valueToString) {
  values.eachWithIndex { value, idx ->
    def str = valueToString(value)
    def q = str.contains(SEPARATOR) || str.contains(QUOTE) || str.contains(NEWLINE)
    OUT.append(q ? QUOTE : "")
      .append(str.replace(QUOTE, QUOTE + QUOTE))
      .append(q ? QUOTE : "")
      .append(idx != values.size() - 1 ? SEPARATOR : NEWLINE)
  }
}

if (TRANSPOSED) {
  def values = new ArrayList<String>[COLUMNS.size()]
  COLUMNS.eachWithIndex { col, i -> values[i] = new ArrayList<String>() }
  ROWS.each { row -> COLUMNS.eachWithIndex { col, i -> values[i].add(FORMATTER.format(row, col)) } }
  COLUMNS.eachWithIndex { _, i -> record(values[i], Closure.IDENTITY) }
}
else {
  ROWS.each { row -> record(COLUMNS, { FORMATTER.format(row, it) }) }
}