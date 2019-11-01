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
    func fetchQuestion()
}

class CharactersListViewModel: CharactersListViewModelProtocol {
    var characters: [Character] = []
    weak var delegate: CharactersListViewModelDelegate?
    
    private var requests: [AnyObject] = []
    private var imageRequest: AnyObject?
    
    func fetchQuestion() {
        let questionRequest = APIRequest(resource: QuestionsResource())
        requests.append(questionRequest)
        questionRequest.load { [weak self] (characters: [Character]?) in
            guard let characters = characters else { return }
            self?.characters = characters
            self?.delegate?.charactersListDidUpdate()
            self?.fetchAvatar(for: characters, completion: { characters in
            })
        }
    }
    
    func fetchAvatar(for characters: [Character], completion: ([Character]) -> Void) {
        for (index, character) in characters.enumerated() {
            guard let imageURL = character.thumbnail?.url else { return }
            
            let imageRequest = ImageRequest(url: imageURL)
            self.requests.append(imageRequest)
            imageRequest.load(withCompletion: { [weak self] (imageData: Data?) in
                guard let imageData = imageData else { return }
                self?.characters[index].imageData = imageData
                self?.delegate?.charactersListDidUpdate()
            })
        }
    }
}
