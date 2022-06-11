
import Foundation

@main
public struct AssetConstantsExec {

    public static func main() throws {
        let arguments = ProcessInfo().arguments
        if arguments.count < 3 {
            print ("missing arguments")
            exit(1)
        }
        let (input, output) = (arguments[1], arguments[2])


        var generatedCode = """
            import Foundation
            import SwiftUI

            """

        try FileManager.default.contentsOfDirectory(atPath: input).forEach { dirent in
            guard dirent.hasSuffix( "imageset") else { return }

            let contentsJsonURL = URL (fileURLWithPath: "\(input)/\(dirent)/Contents.json")
            let jsonData = try Data(contentsOf: contentsJsonURL)
            let assetCatalogContents = try JSONDecoder().decode (Contents.self, from: jsonData)
            let hasImage = assetCatalogContents.images.filter { $0.filename != nil }.isEmpty == false

            if hasImage {
                let basename = contentsJsonURL
                    .deletingLastPathComponent()
                    .deletingPathExtension()
                    .lastPathComponent
                generatedCode.append("public let \(basename) = Image (\"\(basename)\", bundle: .module) \n")

                try generatedCode.write(to: URL(fileURLWithPath: output), atomically: true, encoding: .utf8)
            }
        }
    }


    // MARK: - Model objects
    struct Contents: Decodable {
        let images: [Image]
    }
    struct Image: Decodable {
        let filename: String?
    }
}
