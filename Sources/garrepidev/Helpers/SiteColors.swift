import Foundation
import HyperSwift

public struct SiteColor: CustomStringConvertible {
    let light: CSSColor
    let dark: CSSColor
    let variableName: String
    
    public var description: String {
        "var(--\(variableName))"
    }
    
    init(_ name: String, light: String, dark: String) {
        self.variableName = name
        self.light = CSSColor(light)
        self.dark = CSSColor(dark)
    }
    init(_ name: String, light: CSSColor, dark: CSSColor) {
        self.variableName = name
        self.light = light
        self.dark = dark
    }
}

extension CSSColor {
    init(from siteColor: SiteColor) {
        self = CSSColor(siteColor.description)
    }
}

extension HTMLComponent {
    func color(_ siteColor: SiteColor) -> HTMLComponent {
        color(CSSColor(from: siteColor))
    }
    func backgroundColor(_ siteColor: SiteColor) -> HTMLComponent {
        backgroundColor(CSSColor(from: siteColor))
    }
}

public struct SiteColors {
    static let primaryText = SiteColor("primary-text", light: "black", dark: "white")
    static let secondaryText = SiteColor("secondary-text", light: "#6C6C6C", dark: "#D2D2D2")
    static let bodyBackground = SiteColor("body-background", light: "#b5b5b5", dark: "#434343")
    static let elementBackground = SiteColor("element-background", light: "white", dark: "#171717")
    static let fourOFourRed = SiteColor("fourOfour-red", light: "#FFC0C0", dark: "#FFC0C0")
    static let cardShadow = SiteColor(
        "card-shadow",
        light: CSSColor(r: 0, g: 0, b: 0, a: 0.50),
        dark: CSSColor(r: 51, g: 51, b: 51, a: 0.85)
    )
    static let tagShadow = SiteColor(
        "tag-shadow",
        light: CSSColor(r: 0, g: 0, b: 0, a: 0.14),
        dark: CSSColor(r: 0, g: 0, b: 0, a: 0.14)
    )
    static let all = [
        primaryText,
        secondaryText,
        bodyBackground,
        elementBackground,
        fourOFourRed,
        cardShadow,
        tagShadow
    ]
}
