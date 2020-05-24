import Foundation
struct Homepage {
    static func generate() -> HTMLComponent {
        HTMLComponent {
            HTMLComponent(.div, attributes: ["class": "g_sidebar"]) {
                SimpleHTMLComponent("Projects", attributes: ["href": "#"], .a)
                SimpleHTMLComponent("Blog", attributes: ["href": "#"], .a)
                SimpleHTMLComponent("About", attributes: ["href": "#"], .a)
            }
            
            HTMLComponent(.div, attributes: ["class": "g_main"]) {
                HTMLComponent(.header1, attributes: ["class": "g_header text-center"]) {
                    "Welcome to my website!"
                }
                
                Paragraph(attributes: ["class": "g_body_paragraph"],
                    """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    """
                )
            }
        }
    }
}
