import Foundation

public enum GClasses: String, CustomStringConvertible {
    case card = "g_card"
    case projectCard = "g_project_card"
    case projectCardsGrid = "g_project_cards"
    case blogCard = "g_blog_card"
    case blogCardsGrid = "g_blog_cards"
    case textCard = "g_text_card"
    case sidebar = "g_sidebar"
    case sidebarCompressed = "g_sidebar_compressed"
    case horizontal = "g_horizontal"
    case vertical = "g_vertical"
    case fourOFourCard = "g_404card"
    case aboutCard = "g_about_card"
    public var description: String {
        self.rawValue
    }
}
