#let setup-content() = {
    // Image and Figure
    set image(width: 100%)

    show figure: set block(below: 2em)
    show figure.caption: set text(size: 10pt, style: "italic")
    show figure.caption: set align(center)

    // Table
    set table(
        stroke: 0.5pt,
        inset: (x: 0.5em, y: 0.6em),
        align: horizon
    )

    // Move table caption to top
    show figure.where(kind: table): set figure.caption(position: top)

    // List
    set list(indent: 1em)
    set enum(indent: 1em)

    // Usage: / Term: \ Definition...
    show terms: set par(hanging-indent: 1em, first-line-indent: 0pt)
}