//
//  CharacterTableViewCellViewModel.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 30/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import Foundation

protocol CharacterTableViewCellViewModelProtocol {
    var name: String { get }
    var description: String { get }
    var imageData: Data? { get }
}

class CharacterTableViewCellViewModel: CharacterTableViewCellViewModelProtocol {
    var name: String { return character.name ?? "" }
    var description: String { return character.description ?? "" }
    var imageData: Data? { return character.imageData }
    
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
}
