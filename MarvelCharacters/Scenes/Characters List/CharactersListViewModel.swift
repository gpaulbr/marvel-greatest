//
//  CharactersListViewModel.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

protocol CharactersListViewModelDelegate: AnyObject {
    func charactersListDidUpdate()
}

protocol CharactersListViewModelProtocol: AnyObject {
    var delegate: CharactersListViewModelDelegate? { get set }
    var characters: [Character] { get }
    func fetchCharacters()
}

class CharactersListViewModel: CharactersListViewModelProtocol {
    
    var characters: [Character] = []
    weak var delegate: CharactersListViewModelDelegate?
    
    private var requests: [AnyObject] = []
    private var imageRequest: AnyObject?
    
    private var pageNumber: Int = 0
    private var requestOffset: Int { pageNumber += 1; return pageNumber * 20 }
    
    private var apiClient: APIClient
    
    init(_ apiClient: APIClient) {
        self.apiClient = apiClient
    }
//    func fetchCharacters() {
//        let questionRequest = APIRequest(resource: QuestionsResource())
//        requests.append(questionRequest)
//        questionRequest.load { [weak self] (characters: [Character]?) in
//            guard let characters = characters else { return }
//            self?.characters = characters
//            self?.delegate?.charactersListDidUpdate()
//            self?.fetchAvatar(for: characters, completion: { characters in
//            })
//        }
//    }
    
    func fetchCharacters() {
//        guard pageNumber <= pageNumberMax else { return }
        apiClient.send(GetHeroes(limit: 20, offset: requestOffset)) { response in
            switch response {
            case .success(let dataContainer):
                self.characters.append(contentsOf: dataContainer.results)
                
            case .failure(let error):
                print(error)
            }
            DispatchQueue.main.async {
                self.delegate?.charactersListDidUpdate()
            }
        }
    }
}
