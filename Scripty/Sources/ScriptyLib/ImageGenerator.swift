//
//  ImageGenerator.swift
//  Files
//
//  Created by Ellen Shapiro on 7/8/19.
//

import Files

public struct ImageGenerator {
    
    private static let imageSetPostfix = ".imageset"
    
    public static func generate(catalogFolder: Folder, outputFolder: Folder) throws {
        let boilerplate = try self.generateImageBoilerplate(from: catalogFolder)
        let targetFile = try outputFolder.file(named: "ImageAsset.swift")
        
        try targetFile.write(string: boilerplate)
    }
    
    static func generateImageBoilerplate(from assetCatalog: Folder) throws -> String {
        let imageSets = assetCatalog.subfolders
            .filter { $0.name.hasSuffix(self.imageSetPostfix) }
            .map { $0.name.replacingOccurrences(of: self.imageSetPostfix, with: "") }
        
        let cases = imageSets
            .map { "    case \($0)"}
            .joined(separator: "\n")
        
        let staticLets = imageSets
            .map { "    static let prr_\($0) = UIImage(from: .\($0))" }
            .joined(separator: "\n\n")
        
        let generatedCode = """
/* This file is automatically generated. Don't try to edit it by hand! */
import UIKit

/// Helper class for finding the proper bundle
private class ImageBundleHelper {}

/// Images contained within the asset catalog
public enum ImageAsset: String, CaseIterable {
\(cases)
}

public extension UIImage {
    convenience init(from imageAsset: ImageAsset) {
        self.init(named: imageAsset.rawValue,
                  in: Bundle(for: ImageBundleHelper.self),
                  compatibleWith: nil)!
    }

\(staticLets)
}

"""
        
        return generatedCode
    }
}
