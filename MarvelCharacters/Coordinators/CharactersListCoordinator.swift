//
//  CharactersListCoordinator.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

final class CharactersListCoordinator: CoordinatorNavigable {
    
    var childCoordinators: [Coordinator] = []
    var navigator: NavigatorType
    var rootViewController: UINavigationController
    
    private let charactersListViewController: CharactersListViewController
    
    init() {
        let charactersListViewController = CharactersListViewController()
        self.charactersListViewController = charactersListViewController
        
        let navigationController = UINavigationController(rootViewController: charactersListViewController)
        self.navigator = Navigator(navigationController: navigationController)
        self.rootViewController = navigationController
    }
    
    func start() {
        
    }
    
    
}
