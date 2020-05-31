import Foundation

extension HTMLComponent {
    func margin(top: Double=0, right: Double=0,
                bottom: Double=0, left: Double=0,
                _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "margin: \(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    
    func position(top: Int, left: Int) -> HTMLComponent {
        updateComponent(with: "top: \(top); left: \(left);")
    }
    
    func zIndex(_ index: Int) -> HTMLComponent {
        updateComponent(with: "z-index: \(index);")
    }
    
    func color(_ color: CSSColor) -> HTMLComponent {
        updateComponent(with: "color:\(color.description);")
    }
    
    func width(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "width:\(CSSUnit(width, type));")
    }
    func height(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "height:\(CSSUnit(height, type));")
    }
    
    func maxWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "max-width:\(CSSUnit(width, type));")
    }
    func minWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "min-width:\(CSSUnit(width, type));")
    }
    func maxHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "max-height:\(CSSUnit(height, type));")
    }
    func minHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "min-height:\(CSSUnit(height, type));")
    }
    
    func shadow(x: Int=0, y:Int=0, spread:Int=0, blur:Int = 0, color: CSSColor) -> HTMLComponent {
        updateComponent(with: "box-shadow:\(x)px \(y)px \(blur)px \(spread)px \(color.description);")
    }
    
    func wordWrap(_ wrap: WordWrap) -> HTMLComponent {
        updateComponent(with: "word-wrap: \(wrap.rawValue);")
    }
    
    func objectFit(_ of: ObjectFit) -> HTMLComponent {
        updateComponent(with: "object-fit:\(of.rawValue);")
    }
    
    func whiteSpace(_ wp: WhiteSpace) -> HTMLComponent {
        updateComponent(with: "white-space: \(wp.rawValue);")
    }
    
    func textAlign(_ ta: TextAlign) -> HTMLComponent {
           updateComponent(with: "text-align: \(ta.rawValue);")
       }
    
    func textDecoration(_ td: TextDecoration) -> HTMLComponent {
        updateComponent(with: "text-decoration: \(td.rawValue);")
    }

    func backgroundColor(_ color:CSSColor) -> HTMLComponent {
        updateComponent(with: "background-color: \(color.description);")
    }
    
    func borderRadius(_ radius: Double) -> HTMLComponent {
        updateComponent(with: "border-radius: \(radius)px;")
    }
    
    func display(_ dt: DisplayType) -> HTMLComponent {
        updateComponent(with: "display: \(dt.rawValue);")
    }
    
    func font(weight: String, size: Double, family: String) -> HTMLComponent {
        updateComponent(with: "font-weight:\(weight); font-size:\(size)px; font-family:\(family);")
    }
    
    func rawCSS(_ key: String, _ value: String) -> HTMLComponent {
        updateComponent(with: "\(key): \(value);")
    }
    
    func padding(top: Double=0, right: Double=0, bottom: Double=0, left: Double=0, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        updateComponent(with: "padding:\(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    
    private func updateComponent(with style: String) -> HTMLComponent {
        if let className = self.attributes["class"], className != "" {
            if self.tag != .div && self.tag != .empty {
                CSSStyleSheet.add(style, for: self.tag, parent: className)
            } else {
                CSSStyleSheet.add(style, for: className)
            }
        } else {
            var newAttributes = self.attributes
            if newAttributes["style"] == nil {
                newAttributes["style"] = style
            } else {
                newAttributes["style"]!.append(style)
            }
            self.attributes = newAttributes
        }
        return self
    }
}
