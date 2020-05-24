import Foundation

extension HTMLComponent {
    func setMargin(left: Int, right: Int, top: Int, bottom: Int) -> HTMLComponent {
        var newAttributes = self.attributes ?? ["": ""]
        newAttributes["style"] = "margin:\(left)px \(right)px \(top)px \(bottom)px;"
        return HTMLComponent(self.tag, attributes: newAttributes, self.childComponents)
    }
}
