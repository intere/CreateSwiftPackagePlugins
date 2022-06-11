
import Foundation
import PackagePlugin

@main
struct AssetConstants: BuildToolPlugin {

    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        guard let target = target as? SourceModuleTarget else { return [] }

        return try target.sourceFiles(withSuffix: "xcassets").map { assetCatalog in
            let base = assetCatalog.path.stem
            let input = assetCatalog.path
            let output = context.pluginWorkDirectory.appending(["\(base).swift"])
            return .buildCommand(displayName: "Generating constants for base \(base)",
                                 executable: try context.tool(named: "AssetConstantsExec").path,
                                 arguments: [input.string, output.string],
                                 inputFiles: [input],
                                 outputFiles: [output]
            )
        }
    }
}
