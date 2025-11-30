#let setup-text(lang: "en")={
    // Set paragraph rules
    set par(
        justify: true,
        leading: 0.65em,
        spacing: 12pt,
        first-line-indent: 0pt,
    )

    // Set font rules
    set text(
        font: "IBM Plex Serif",
        size: 11pt,
        lang: lang,
        region: "VN"
    )

    show raw: set text(font: "JetBrains Mono") // for code blocks
}