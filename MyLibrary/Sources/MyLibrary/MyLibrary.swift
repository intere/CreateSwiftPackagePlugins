@main
public struct MyLibrary {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(MyLibrary().text)
    }
}

import Foundation

public func GetLocalizedString() -> String {
    return NSLocalizedString( "🌎", bundle: .module, comment: "A comment about the localizable string")
}
