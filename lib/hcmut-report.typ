#import "utils.typ": duallang
#import "settings/text.typ": setup-text
#import "settings/page.typ": setup-page
#import "settings/code.typ": setup-code
#import "settings/math.typ": setup-math
#import "settings/content.typ": setup-content
#import "titlepage.typ": titlepage
#import "summary.typ": make-summary

#let report(
  lang: "vi",
  author: "",
  subject: "",
  project: "",
  instructors: (),
  implementers: (),
  university: "VIETNAM NATIONAL UNIVERSITY - HO CHI MINH CITY",
  faculty: "HO CHI MINH CITY UNIVERSITY OF TECHNOLOGY",
  logo-path: "../lib/template/logo.png",
  print-mode: "oneside",
  toc: true,
  body
) = {
  set document(title: project, author: author)

  // --- 1. Title Page ---
  titlepage(
    project: project,
    subject: subject,
    instructors: instructors,
    implementers: implementers,
    university_0: university,
    faculty: faculty,
    logo-path: logo-path,
    lang: lang
  )

  // --- 2. Global Styles Wrapper ---
  // We apply the page setup first, then the content styling
  setup-page(
    print-mode: print-mode,
    subject: subject,
    lang: lang,
    
    // This block contains the actual content styling
    {
      // A. Apply Fonts (Revert text.typ to the previous version if you want, 
      // or just call it here if you fixed it. 
      // But let's apply the critical numbering HERE to be 100% sure).
      set heading(numbering: "1.1")
      show heading: set block(above: 1.5em, below: 1em)
      
      // Call your other setups (Assuming they use 'show' rules or 'set' rules)
      // For 'show' rules to work from external files, we need to apply them to 'body'.
      
      // Let's use the 'show' rule trick for the body:
      show: doc => {
        // Apply Font Settings
        setup-text(lang: lang, doc) // Use the new wrapper version of text.typ
      }
      
      show: doc => {
        setup-code()
        setup-math()
        setup-content()
        doc
      }

      // --- 3. TOC ---
      if toc {
        make-summary(lang: lang)
      }

      // --- 4. Content ---
      body
    }
  )
}