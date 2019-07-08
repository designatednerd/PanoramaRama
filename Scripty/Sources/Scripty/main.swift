// drop the first argument, which is the path to the script
let args = CommandLine.arguments.dropFirst()
print("Arguments: \(args)")

let plistFile = try SourceFolders.appRoot.file(named: "Environment.plist")

if args.contains("--prebuild") {
    print("Run pre-build tasks")
    try EnvironmentUpdater.updateEnvironment(file: plistFile)
    try ImageGenerator.run(catalogFolder: SourceFolders.assetCatalog, outputFolder: SourceFolders.generatedCode)
}

if args.contains("--postbuild") {
    print("Run post-build tasks")
    try EnvironmentUpdater.resetEnvironment(file: plistFile)
}
