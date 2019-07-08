//
//  EnvironmentUpdater.swift
//  Scripty
//
//  Created by Ellen Shapiro on 7/8/19.
//

import Foundation
import Files
import Plister

public struct EnvironmentUpdater {
    enum EnvError: Error, LocalizedError {
        case couldntLoadFromEnv
        
        var localizedDescription: String {
            switch self {
            case .couldntLoadFromEnv:
                return "Couldn't load all information from the environment"
            }
        }
    }
    
    public static func updateEnvironment(file: File) throws {
        if
            let secretsFolder = SourceFolders.secrets,
            let secrets = try? secretsFolder.file(named: "production.json") {
                let json = try JSONLoader.loadJSONDictionary(from: secrets)
                try json.forEach { key, value in
                    try Plister.setValue(value, for: key, in: file)
                }
        } else {
            let env = ProcessInfo.processInfo.environment
            guard let stringSecret = env["string_secret"] else {
                throw EnvironmentUpdater.EnvError.couldntLoadFromEnv
            }
            
            try Plister.setValue(stringSecret, for: "string_secret", in: file)
        }
    }
    
    public static func resetEnvironment(file: File) throws {
        try file.resetToGitHEAD()
    }
}
