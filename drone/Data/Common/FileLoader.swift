//
//  FileLoader.swift
//  drone
//
//  Created by raulbot on 19/1/23.
//

import Foundation

public struct FileLoader {
    func loadJson(filename fileName: String) throws -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            let data = try Data(contentsOf: url)
            return data
        }
        return nil
    }
}
