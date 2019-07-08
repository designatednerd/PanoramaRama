//
//  SourceFolders.swift
//  Scripty
//
//  Created by Ellen Shapiro on 7/8/19.
//

import Foundation
import Files

public struct SourceFolders {
    
    public static var scriptRoot: Folder {
        let currentFile = try! File(path: #file)
        let sourcesForScripty = currentFile.parent
        let overallSources = sourcesForScripty!.parent
        return overallSources!.parent!
    }
    
    public static var sourceRoot: Folder {
        return self.scriptRoot.parent!
    }
    
    public static var appRoot: Folder {
        return try! self.sourceRoot.subfolder(named: "PanoramaRama")
    }
    
    public static var assetCatalog: Folder {
        return try! self.appRoot.subfolder(named: "Assets.xcassets")
    }
    
    public static var generatedCode: Folder {
        return try! self.appRoot.subfolder(named: "GeneratedCode")
    }
    
    public static var secrets: Folder? {
        return try? self.sourceRoot.subfolder(named: ".secrets")
    }
}
