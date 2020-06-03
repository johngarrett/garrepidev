import Foundation

public enum GClasses: String, CustomStringConvertible {
    case projectCard = "g_project_card"
    case projectCardsGrid = "g_project_cards"
    case blogCard = "g_blog_card"
    case blogCardsGrid = "g_blog_cards"
    case sidebar = "g_sidebar"
    case horizontal = "g_horizontal"
    case vertical = "g_vertical"
    public var description: String {
        self.rawValue
    }
}
