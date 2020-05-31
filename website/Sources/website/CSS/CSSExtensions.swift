import Foundation

extension HTMLComponent {
    func margin(top: Double=0, right: Double=0,
                bottom: Double=0, left: Double=0,
                _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        newComponent(with: "margin:\(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    
    func position(top: Int, left: Int) -> HTMLComponent {
        newComponent(with: "top: \(top); left: \(left);")
    }
    
    func zIndex(_ index: Int) -> HTMLComponent {
        newComponent(with: "z-index: \(index);")
    }
    
    func color(_ color: CSSColor) -> HTMLComponent {
        newComponent(with: "color:\(color.stringValue);")
    }
    
    func width(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        newComponent(with: "width:\(CSSUnit(width, type));")
    }
    func height(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        newComponent(with: "height:\(CSSUnit(height, type));")
    }
    
    func maxWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        newComponent(with: "max-width:\(CSSUnit(width, type));")
    }
    func minWidth(_ width: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        newComponent(with: "min-width:\(CSSUnit(width, type));")
    }
    func maxHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        newComponent(with: "max-height:\(CSSUnit(height, type));")
    }
    func minHeight(_ height: Double, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        return newComponent(with: "min-height:\(CSSUnit(height, type));")
    }
    
    func shadow(x: Int=0, y:Int=0, spread:Int=0, blur:Int = 0, color: CSSColor) -> HTMLComponent {
        return newComponent(with: "box-shadow:\(x)px \(y)px \(blur)px \(spread)px \(color.stringValue);")
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

    func backgroundColor(_ color:CSSColor) -> HTMLComponent {
        newComponent(with: "background-color: \(color.stringValue);")
    }
    
    func borderRadius(_ radius: Double) -> HTMLComponent {
        newComponent(with: "border-radius: \(radius)px;")
    }
    
    func display(_ dt: DisplayType) -> HTMLComponent {
        newComponent(with: "display: \(dt.rawValue);")
    }
    
    func font(weight: String, size: Double, family: String) -> HTMLComponent {
        newComponent(with: "font-weight:\(weight); font-size:\(size)px; font-family:\(family);")
    }
    
    func rawCSS(_ key: String, _ value: String) -> HTMLComponent {
        newComponent(with: "\(key): \(value);")
    }
    
    func padding(top: Double=0, right: Double=0, bottom: Double=0, left: Double=0, _ type: CSSUnit.UnitType = .px) -> HTMLComponent {
        return newComponent(with: "padding:\(CSSUnit(top, type)) \(CSSUnit(right, type)) \(CSSUnit(bottom, type)) \(CSSUnit(left, type));")
    }
    
    func saveToStyleSheet() -> HTMLComponent {
        guard let className = attributes["class"], let style = attributes["style"] else {
            print("missing class or style attributes")
            return self
        }
        Generator.updateStyleSheet(with: """
            .\(className) {
            \(style)
            }
        """)
        return self
    }
    
    private func newComponent(with style: String) -> HTMLComponent {
        var newAttributes = self.attributes
        if newAttributes["style"] == nil {
            newAttributes["style"] = style
        } else {
            newAttributes["style"]!.append(style)
        }
        
        self.attributes = newAttributes
        return self
    }
}
