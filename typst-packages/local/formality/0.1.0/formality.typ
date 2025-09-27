// A template for formatting a formal letter using the style common in France
// Croatia, Serbia, Bosnia and several other European countries.

#let formality(
  // The letter the language is written in, as an ISO 639 language code.
  // Ex: "en" for English, "fr" for French, "hr" for Croatian.
  //
  // This is important for correct hyphenation, quote charactes and other
  // typography.
  lang: "",
  // The sender's ISO 3166-1 alpha-2 region code.
  // Ex: "gb" for Great Britain, "us" for USA, "hr" for Croatia.
  //
  // This is important for correct hyphenation, quote charactes and other
  // typography. Often the same as the language code, but not always!
  // The "en" language is used differently in "gb" vs "us" vs "au".
  region: "",
  // The letter's sender, displayed in the top left.
  sender: [],
  // The dateline, which commonly includes a place and date of writing and
  // which is displayed after the `sender` content.
  // Ex: "Executive Mansion, Washington, Nov. 21, 1864."
  dateline: [],
  // The letter's recipient, displayed right-aligned after the dateline.
  recipient: [],
  // The subject line.
  subject: [],
  // The name with which the letter closes.
  name: [],
  // The letter's content.
  body,
) = {
  set page(
    paper: "a4",
    // Common margins for EU letters.
    margin: 2.5cm,
    numbering: "1",
  )

  set text(
    lang: lang,
    region: region,
    font: ("Minion 3", "Minion Pro", "Minion", "Libertinus Serif"),
    size: 12pt,
  )

  set par(
    // Formal letters look more professional when justified.
    justify: true,
    // This is the default for justified text, but setting it can't hurt.
    linebreaks: "optimized",
    // These properties do not work the same as similar CSS properties, which
    // leads to much confusion with online information.
    leading: 0.85em,
    spacing: 1.5em,
  )

  // More sensible spacing before/after headings.
  show heading: set block(above: 1.5em, below: 0.75em)
  // Default heading sizes are fine for 12pt body text.

  align(
    left,
    {
      sender
      // Gives some top clearance
      par(dateline)
    },
  )
  v(3em)
  align(
    right,
    box(align(left, recipient)),
  )
  v(4em)

  pad(right: 10%, strong(subject))

  body

  v(1.5cm)
  align(right, smallcaps(name))
}
