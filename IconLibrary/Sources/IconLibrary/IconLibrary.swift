public struct IconLibrary {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image("Star", bundle: .module)
        Star
            .resizable()
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
