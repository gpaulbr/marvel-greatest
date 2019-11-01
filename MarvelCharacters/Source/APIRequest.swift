//
//  APIRequest.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 25/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        let wrapper = try? JSONDecoder().decode(DataWrapper<Resource.ModelType>.self, from: data)
        return wrapper?.data.results
    }
    
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
