import Foundation

class HStack: HTMLComponent {
    init(_ cls: String = GClasses.horizontal.rawValue, children: [HTMLElement]? = nil) {
        super.init(.div, className: cls, children)
    }
}

extension HStack {
    convenience init(cls: String = GClasses.horizontal.rawValue, @HStackBuilder _ children: () -> [HTMLElement]) {
        self.init(cls, children: children())
    }
    convenience init(cls: String = GClasses.horizontal.rawValue, @HStackBuilder _ child: () -> HTMLElement) {
        self.init(cls, children: [child()])
    }
}

@_functionBuilder
struct HStackBuilder {
    static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}

class VStack: HTMLComponent {
    init(_ cls: String = GClasses.vertical.rawValue, children: [HTMLElement]? = nil) {
        super.init(.div, className: cls, children)
    }
}

extension VStack {
    convenience init(cls: String = GClasses.vertical.rawValue, @VStackBuilder _ children: () -> [HTMLElement]) {
        self.init(cls, children: children())
    }

    convenience init(cls: String = GClasses.vertical.rawValue, @VStackBuilder _ child: () -> HTMLElement) {
        self.init(cls, children: [child()])
    }
}

@_functionBuilder
struct VStackBuilder {
    static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}
