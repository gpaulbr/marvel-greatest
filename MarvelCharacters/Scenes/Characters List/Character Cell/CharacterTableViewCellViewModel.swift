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
    var imageUrl: URL? { get }
    var imageDownloadCancellation: Bindable<Bool> { get }
}

class CharacterTableViewCellViewModel: CharacterTableViewCellViewModelProtocol {
    
    var imageDownloadCancellation: Bindable<Bool> = Bindable(false)
    
    var name: String { return character.name ?? "" }
    var description: String { return character.description ?? "" }
    var imageUrl: URL? { return character.thumbnail?.url }
    
    private var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    func cancelImageDownload() {
        imageDownloadCancellation.update(with: true)
    }
}
