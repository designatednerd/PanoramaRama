// drop the first argument, which is the path to the script
let args = CommandLine.arguments.dropFirst()
print("Args: \(args)")

let plistFile = try SourceFolders.appRoot.file(named: "Environment.plist")

if args.contains("--prebuild") {
    // Run pre-build tasks
    try EnvironmentUpdater.updateEnvironment(file: plistFile)
}

if args.contains("--postbuild") {
    // Run post-build tasks
    try EnvironmentUpdater.resetEnvironment(file: plistFile)
}
