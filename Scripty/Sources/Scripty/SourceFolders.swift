//
//  SourceFolders.swift
//  Scripty
//
//  Created by Ellen Shapiro on 7/8/19.
//

import Foundation
import Files

struct SourceFolders {
    
    static var scriptRoot: Folder {
        let currentFile = try! File(path: #file)
        let sourcesForScripty = currentFile.parent
        let overallSources = sourcesForScripty!.parent
        return overallSources!.parent!
    }
    
    static var sourceRoot: Folder {
        return self.scriptRoot.parent!
    }
    
    static var appRoot: Folder {
        return try! self.sourceRoot.subfolder(named: "PanoramaRama")
    }
    
    static var assetCatalog: Folder {
        return try! self.appRoot.subfolder(named: "Assets.xcassets")
    }
    
    static var generatedCode: Folder {
        return try! self.appRoot.subfolder(named: "GeneratedCode")
    }
    
    static var secrets: Folder? {
        return try? self.sourceRoot.subfolder(named: ".secrets")
    }
}
