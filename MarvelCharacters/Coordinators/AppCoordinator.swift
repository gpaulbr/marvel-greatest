//
//  AppCoordinator.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

/** The application's root `Coordinator`. */

final class AppCoordinator: CoordinatorPresentable {
    
    var childCoordinators: [Coordinator] = []
    var rootViewController = AppRootViewController()
    
    init(window: UIWindow) {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func start() {
        route()
    }
    
}

// MARK: - Routing

private extension AppCoordinator {
    
    func route() {
        let charactersListCoordinator = CharactersListCoordinator()
        addChildCoordinator(charactersListCoordinator)
        charactersListCoordinator.start()
        rootViewController.set(childViewController: charactersListCoordinator.rootViewController)
    }
    
}

