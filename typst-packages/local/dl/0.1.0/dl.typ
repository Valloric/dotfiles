// A template for a DL standard envelope, the most common size used.
// Accepts a sender and receiver address and properly positions them.

#let dl(
  // The letter's sender, displayed in the top left.
  sender: [],
  // Any additional shift of sender address block towards the right
  sender_right_shift: 0cm,
  // Any additional shift of sender address block towards the bottom
  sender_bottom_shift: 0cm,
  // The letter's recipient, displayed in the bottom right.
  recipient: [],
  // Any additional shift of receipient address block towards the left
  recipient_left_shift: 0cm,
  // Any additional shift of receipient address block towards the top
  recipient_top_shift: 0cm,
  // Any other content
  body,
) = {
  set page(
    // DL envelope size is 22x11 cm
    width: 22cm,
    height: 11cm,
    margin: (
      x: 20mm,
      y: 15mm,
    ),
  )

  set text(
    font: ("Minion 3", "Minion Pro", "Minion", "Libertinus Serif"),
    size: 13pt,
  )

  move(
    dx: sender_right_shift,
    dy: sender_bottom_shift,
    sender,
  )
  body

  align(
    right + bottom,
    move(
      dx: -(1.5cm + recipient_left_shift),
      dy: -(0.5cm + recipient_top_shift),
      block(align(left, recipient)),
    ),
  )
}
