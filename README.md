# HCMUT Report Template

## 📋 Prerequisites

- [Typst](https://typst.app/) installed (v0.11.0 or later recommended)
- The bundled fonts (IBM Plex Serif, JetBrains Mono, Source Sans Pro)

## 🚀 Quick Start

1. **Clone or download this template**

2. **Edit [`main.typ`](main.typ:1)**:

   ```typst
   #import "lib/hcmut-report.typ": report

   #show: report.with(
       lang: "en",
       subject: "CO2039 - Advanced Operating Systems",
       project: "Assignment 1",
       author: "Nguyen Van A",
       instructors: ("Dr. Truong Thi Thai Minh",),
       implementers: (("Nguyen Van A", "2012345"),),
   )

   = Introduction
   Your content here...
   ```

3. **Compile the document**:

   ```bash
   typst compile main.typ --font-path ./fonts
   ```

4. **View the output**: Open [`main.pdf`](main.pdf:1)

5. **Auto reflect changes**:
    ```bash
    typst watch main.typ --font-path ./fonts
    ```

## ⚙️ Configuration Options

### Basic Configuration

Configure your document in [`main.typ`](main.typ:3) using [`report.with()`](lib/hcmut-report.typ:10):

| Parameter      | Type    | Default                            | Description                         |
| -------------- | ------- | ---------------------------------- | ----------------------------------- |
| `lang`         | String  | `"vi"`                             | Language: `"en"` or `"vi"`          |
| `subject`      | String  | `""`                               | Course code and name                |
| `project`      | String  | `""`                               | Assignment/project title            |
| `author`       | String  | `""`                               | Author name                         |
| `instructors`  | Array   | `()`                               | List of instructor names            |
| `implementers` | Array   | `()`                               | List of `(name, student_id)` tuples |
| `university`   | String  | `"VIETNAM NATIONAL UNIVERSITY..."` | University name                     |
| `faculty`      | String  | `"HO CHI MINH CITY..."`            | Faculty name                        |
| `logo-path`    | String  | `"../lib/template/logo.png"`       | Path to university logo             |
| `print-mode`   | String  | `"oneside"`                        | `"oneside"` or `"twoside"`          |
| `toc`          | Boolean | `true`                             | Show table of contents              |

### Example Configurations

#### English Report

```typst
#show: report.with(
    lang: "en",
    subject: "CS101 - Introduction to Programming",
    project: "Final Project",
    author: "John Doe",
    instructors: ("Dr. Jane Smith", "Prof. Bob Johnson"),
    implementers: (
        ("John Doe", "2012345"),
        ("Alice Brown", "2012346"),
    ),
)
```

#### Vietnamese Report

```typst
#show: report.with(
    lang: "vi",
    subject: "CO2039 - Hệ điều hành nâng cao",
    project: "Bài tập lớn 1",
    author: "Nguyễn Văn A",
    instructors: ("TS. Trương Thị Thái Minh",),
    implementers: (("Nguyễn Văn A", "2012345"),),
)
```

#### Minimal Report (No TOC)

```typst
#show: report.with(
    lang: "en",
    subject: "Quick Report",
    project: "Short Assignment",
    author: "Student Name",
    toc: false,  // Disable table of contents
)
```

## 📁 Template Structure

```
typst_test/
├── main.typ                    # Your main document
├── main.pdf                    # Compiled output
├── fonts/                      # Custom fonts
│   ├── IBMPlexSerif-*.ttf     # Body text font
│   ├── JetBrainsMono-*.ttf    # Code font
│   └── SourceSansPro-*.ttf    # Alternative font
└── lib/                        # Template library
    ├── hcmut-report.typ       # Main template file
    ├── titlepage.typ          # Title page layout
    ├── summary.typ            # TOC and LOF
    ├── utils.typ              # Helper functions
    ├── settings/
    │   ├── text.typ           # Text and heading styles
    │   ├── page.typ           # Page layout and margins
    │   ├── code.typ           # Code block styling
    │   ├── math.typ           # Math equation styling
    │   └── content.typ        # Tables, figures, lists
    └── template/
        └── logo.png           # University logo
```

## 🎨 Customization Guide

### Change Fonts

Edit [`lib/settings/text.typ`](lib/settings/text.typ:11):

```typst
set text(
    font: "Your Font Name",  // Change body font
    size: 11pt,
)

show raw: set text(font: "Your Code Font")  // Change code font
```

### Adjust Margins

Edit [`lib/settings/page.typ`](lib/settings/page.typ:59):

```typst
let inside-margin = 35mm   // Left margin (oneside) or inside margin (twoside)
let outside-margin = 15mm  // Right margin (oneside) or outside margin (twoside)
```

### Modify Code Block Styling

Edit [`lib/settings/code.typ`](lib/settings/code.typ:3):

```typst
show raw.where(block: false): box.with(
    fill: luma(240),      // Background color for inline code
    radius: 2pt,          // Border radius
)

show raw.where(block: true): block.with(
    fill: luma(245),      // Background color for code blocks
    stroke: luma(100),    // Border color
    radius: 4pt,          // Border radius
)
```

### Customize Heading Styles

Edit [`lib/settings/text.typ`](lib/settings/text.typ:20):

```typst
set heading(numbering: "1.1")  // Change numbering format
show heading: set block(above: 2em, below: 1em)
show heading.where(level: 1): set text(size: 14pt)
show heading.where(level: 2): set text(size: 12pt)
```

### Change Table Styling

Edit [`lib/settings/content.typ`](lib/settings/content.typ:9):

```typst
set table(
    stroke: 0.5pt,           // Border thickness
    inset: 5pt,              // Cell padding
    align: center + horizon, // Cell alignment
)
```

### Modify Title Page

Edit [`lib/titlepage.typ`](lib/titlepage.typ:14) to change:

- University names
- Layout spacing
- Font sizes
- Logo positioning

### Add Custom Background

Uncomment line 73 in [`lib/settings/page.typ`](lib/settings/page.typ:73):

```typst
set page(
    paper: "a4",
    margin: margin-dict,
    header: header-content,
    footer: footer-content,
    background: background-content,  // Uncomment this
)
```

## 📝 Writing Content

### Headings

```typst
= Level 1 Heading
== Level 2 Heading
=== Level 3 Heading
```

### Code Blocks

````typst
// Inline code
This is `inline code`.

// Code block with syntax highlighting
```cpp
#include <iostream>
int main() {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
\```
````

### Tables

```typst
#figure(
    table(
        columns: (1fr, 2fr, 1fr),
        align: (center, left, center),
        table.header([*ID*], [*Description*], [*Value*]),
        [1], [Item 1], [100],
        [2], [Item 2], [200],
    ),
    caption: [My Table],
)<MyTableLabel>
```

Reference tables: `@MyTableLabel`

### Lists

```typst
// Unordered list
- Item 1
- Item 2
  - Nested item

// Ordered list
+ First
+ Second
+ Third
```

### Math Equations

```typst
// Inline math
The equation $E = mc^2$ is famous.

// Block equation
$ integral_0^infinity e^(-x^2) dif x = sqrt(pi)/2 $
```

### Figures

```typst
#figure(
    image("path/to/image.png", width: 70%),
    caption: [My Figure],
)<MyFigureLabel>
```

Reference figures: `@MyFigureLabel`

### Theorem Boxes

Use the [`theorem()`](lib/settings/math.typ:10) function:

```typst
#theorem("Pythagorean Theorem")[
    In a right triangle: $a^2 + b^2 = c^2$
]
```

## 🔧 Advanced Usage

### Custom Helper Functions

The [`duallang()`](lib/utils.typ:1) function handles bilingual text:

```typst
#import "lib/utils.typ": duallang

#let my-text = duallang("en", "Hello", "Xin chào")
```

### Multiple Authors

```typst
implementers: (
    ("Student 1", "2012345"),
    ("Student 2", "2012346"),
    ("Student 3", "2012347"),
)
```

### Custom Logo

Replace [`lib/template/logo.png`](lib/template/logo.png:1) with your logo, or specify a different path:

```typst
#show: report.with(
    logo-path: "path/to/your/logo.png",
    // ...
)
```

### Two-Side Printing

For bound reports:

```typst
#show: report.with(
    print-mode: "twoside",
    // ...
)
```

This adjusts margins for binding (inside/outside instead of left/right).

## 🐛 Troubleshooting

### Fonts Not Working

Ensure fonts are in the [`fonts/`](fonts:1) directory. Typst will automatically detect them.

### TOC Not Showing

Check that `toc: true` is set in [`report.with()`](lib/hcmut-report.typ:10).

### Page Numbers Wrong

The page counter resets after TOC. Check [`lib/summary.typ`](lib/summary.typ:21) line 21.

### Compilation Errors

- Ensure you're using Typst v0.11.0 or later
- Check for syntax errors in your content
- Verify all file paths are correct

## 📚 Resources

- [Typst Documentation](https://typst.app/docs)
- [Typst Tutorial](https://typst.app/docs/tutorial)
- [Typst Reference](https://typst.app/docs/reference)

## 🤝 Contributing

Feel free to customize this template for your needs. Share improvements with your classmates!

---
