let GPHead = HTMLHead()
Generator.render(component:
    HTMLPage(head: GPHead) {
        Paragraph("Hello world!")
    }
)
