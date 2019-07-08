//
//  JSONLoader.swift
//  Scripty
//
//  Created by Ellen Shapiro on 7/8/19.
//

import Foundation
import Files

/// Errors loading local json
///
/// - couldntConvertToData: Occurs when file contents couldn't be converted to NSData.
/// - couldntConvertToProperDictionaryType: Occurs when JSON de-serialization to a dictionary fails.
enum JSONLoaderError: Error {
    case couldntConvertToData
    case couldntConvertToProperDictionaryType
}

/// Something which loads JSON.
struct JSONLoader {
    
    /// Loads the provided file and tries to parse it as a dictionary of type `[String: AnyHashable]`.
    ///
    /// - Parameter file: The file where the JSON is located.
    /// - Returns: The parsed dictionary.
    static func loadJSONDictionary(from file: File) throws -> [String: AnyHashable] {
        let jsonString = try file.readAsString()
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw JSONLoaderError.couldntConvertToData
        }
        
        guard
            let dict = try? JSONSerialization.jsonObject(with: jsonData, options: []),
            let typedDict = dict as? [String: AnyHashable] else {
                throw JSONLoaderError.couldntConvertToProperDictionaryType
        }
        
        return typedDict
    }
}
