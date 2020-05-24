Generator.render(
    Root(title: "garrepi") {
        HTMLComponent(.div) {
            HTMLComponent(.footer) {
                RawText("This is the footer")
                Paragraph("Hello world!")
            }
            HTMLComponent(.bold) {
                Paragraph("Hello world again!")
            }
        }
    }
)
