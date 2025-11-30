#import "utils.typ": duallang
#import "settings/text.typ": setup-text
#import "settings/page.typ": setup-page

#let report(
    lang: "en",
    author: "",
    subject: "",
    project: "",
    print-mode: "oneside",
    body,
) = {
    // 1. Set Document Metadata
    set document(title: project, author: author)

    // 2. Text settings
    show: body => {
        setup-text(lang: lang)
        body
    }

    // Page settings
    setup-page(
        print-mode: print-mode,
        subject: subject,
        lang: lang,
        body
    )
}
