//
//  CharactersListCoordinator.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit
import SnapKit

final class CharactersListCoordinator: CoordinatorNavigable {
    
    var childCoordinators: [Coordinator] = []
    var navigator: NavigatorType
    var rootViewController: UINavigationController
    
    private let charactersListViewController: CharactersListViewController
    private let apiClient = APIClient(publicKey: "e81a62777a0b00f8e8b85887fd58d16a", privateKey: "3f1235b807e85e11e9f8a5043440d4753ce037ec")
    
    init() {
        let charactersListViewModel = CharactersListViewModel(apiClient)
        let charactersListViewController = CharactersListViewController(viewModel: charactersListViewModel)
        self.charactersListViewController = charactersListViewController
        
        let navigationController = UINavigationController(rootViewController: charactersListViewController)
        self.navigator = Navigator(navigationController: navigationController)
        self.rootViewController = navigationController
    }
    
    func start() {
        
    }
    
    
}
