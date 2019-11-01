//
//  ImageRequest.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 31/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func decode(_ data: Data) -> Data? {
        return data
    }
    
    func load(withCompletion completion: @escaping (Data?) -> Void) {
        load(url, withCompletion: completion)
    }
}
