import Foundation

extension HTMLComponent {
    func margin(top: Int=0, right: Int=0,
                bottom: Int=0, left: Int=0,
                percentage: Bool = false) -> HTMLComponent {
        let unit = percentage ? "%" : "px"
        return newComponent(with: "margin:\(top)\(unit) \(right)\(unit) \(bottom)\(unit) \(left)\(unit);")
    }
    
    func color(_ color: String) -> HTMLComponent {
        newComponent(with: "color:\(color);")
    }
    
    func width(_ width: Int, percentage: Bool = false) -> HTMLComponent {
       let unit = percentage ? "%" : "px"
       return newComponent(with: "width:\(width)\(unit);")
    }
    func height(_ height: Int, percentage: Bool = false) -> HTMLComponent {
       let unit = percentage ? "%" : "px"
       return newComponent(with: "height:\(height)\(unit);")
    }
    
    func maxWidth(_ width: Int, percentage: Bool = false) -> HTMLComponent {
        let unit = percentage ? "%" : "px"
        return newComponent(with: "max-width:\(width)\(unit);")
    }
    func minWidth(_ width: Int, percentage: Bool = false) -> HTMLComponent {
        let unit = percentage ? "%" : "px"
        return newComponent(with: "min-width:\(width)\(unit);")
    }
    func maxHeight(_ height: Int, percentage: Bool = false) -> HTMLComponent {
        let unit = percentage ? "%" : "px"
        return newComponent(with: "max-height:\(height)\(unit);")
    }
    func minHeight(_ height: Int, percentage: Bool = false) -> HTMLComponent {
        let unit = percentage ? "%" : "px"
        return newComponent(with: "min-height:\(height)\(unit);")
    }
    
    func shadow(x: Int=0, y:Int=0, spread:Int=0, blur:Int = 0, color: String) -> HTMLComponent {
        return newComponent(with: "box-shadow:\(x)px \(y)px \(blur)px \(spread)px \(color);")
    }
    
    func wordWrap(_ wrap: WordWrap) -> HTMLComponent {
        newComponent(with: "word-wrap: \(wrap.rawValue);")
    }
    
    func objectFit(_ of: ObjectFit) -> HTMLComponent {
        newComponent(with: "object-fit:\(of.rawValue);")
    }
    
    func whiteSpace(_ wp: WhiteSpace) -> HTMLComponent {
        newComponent(with: "white-space: \(wp.rawValue);")
    }
    
    func textAlign(_ ta: TextAlign) -> HTMLComponent {
           newComponent(with: "text-align: \(ta.rawValue);")
       }
    
    func textDecoration(_ td: TextDecoration) -> HTMLComponent {
        newComponent(with: "text-decoration: \(td.rawValue);")
    }

    func backgroundColor(_ color:String) -> HTMLComponent {
        newComponent(with: "background-color: \(color);")
    }
    
    func borderRadius(_ radius: Int) -> HTMLComponent {
        newComponent(with: "border-radius: \(radius)px;")
    }
    
    func font(weight: String, size: Int, family: String) -> HTMLComponent {
        newComponent(with: "font-weight:\(weight); font-size:\(size)px; font-family:\(family);")
    }
    
    func padding(top: Int=0, right: Int=0, bottom: Int=0, left: Int=0, percentage: Bool = false) -> HTMLComponent {
        let unit = percentage ? "%" : "px"
        return newComponent(with: "padding:\(top)\(unit) \(right)\(unit) \(bottom)\(unit) \(left)\(unit);")
    }
    
    private func newComponent(with style: String) -> HTMLComponent {
        var newAttributes = self.attributes ?? ["": ""]
        if newAttributes["style"] == nil {
            newAttributes["style"] = style
        } else {
            newAttributes["style"]!.append(style)
        }
        return HTMLComponent(self.tag, attributes: newAttributes, self.childComponents)
    }
}
