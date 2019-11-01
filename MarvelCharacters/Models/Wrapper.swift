//
//  Wrapper.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 30/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation

struct Wrapper<T: Decodable>: Decodable {
    let results: [T]
}
