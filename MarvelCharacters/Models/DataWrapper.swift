//
//  DataWrapper.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 30/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation

struct DataWrapper<T: Decodable>: Decodable {
    let code: Int
    let data: Wrapper<T>
}
