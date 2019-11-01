//
//  Character.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 30/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let thumbnail: Image?
    var imageData: Data?
}
