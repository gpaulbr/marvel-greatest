//
//  APIResource.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 25/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation
import CryptoSwift

protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension APIResource {
    var privateKey: String { return "3f1235b807e85e11e9f8a5043440d4753ce037ec" }
    var publicKey: String { return "e81a62777a0b00f8e8b85887fd58d16a" }
    var url: URL {
        var components = URLComponents(string: "https://gateway.marvel.com:443")!
        components.path = "/v1/public\(methodPath)"
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = "\(timestamp)\(privateKey)\(publicKey)".md5()

        components.queryItems = [
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "apikey", value: publicKey)
        ]
        return components.url!
    }
}

struct QuestionsResource: APIResource {
    typealias ModelType = Character
    let methodPath = "/characters"
}
