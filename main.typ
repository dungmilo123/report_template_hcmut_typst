#import "lib/hcmut-report.typ": report

#show: report.with(
    lang: "en",
    subject: "CO2039 - Advanced Operating Systems",
    project: "Assignment 1",
    author: "Nguyen Van A",
    print-mode: "oneside"
)

= Introduction
This is the test of the text settings. The font should be IBM Plex Serif.

```cpp
#include <iostream>
int main() {
    std::cout << "Hello Typst!" << std::endl;
    return 0;
}
```
#pagebreak()

= Second Page 
Check the header and footer here. The page number should say "2/2"
