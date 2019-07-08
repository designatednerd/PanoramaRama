//
//  EnvironmentUpdater.swift
//  Scripty
//
//  Created by Ellen Shapiro on 7/8/19.
//

import Foundation
import Files
import Plister

struct EnvironmentUpdater {
    
    static func updateEnvironment(file: File) throws {
        try Plister.setValue("I was updated!", for: "string_secret", in: file)
    }
    
    static func resetEnvironment(file: File) throws {
        try file.resetToGitHEAD()
    }
}
