Generator.render(
    Root(title: "garrepi") {
        Comment("Hello comments!")
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
