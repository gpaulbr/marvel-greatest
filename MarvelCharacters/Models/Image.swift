//
//  Image.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 31/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation

struct Image: Decodable {
    let path: String?
    let `extension`: String?
    var url: URL? {
        guard let http = URL(string: "\(path ?? "").\(`extension` ?? "")") else { return nil }
        guard var components = URLComponents(url: http, resolvingAgainstBaseURL: false) else { return nil }
        components.scheme = "https"
        return components.url
    }
}
