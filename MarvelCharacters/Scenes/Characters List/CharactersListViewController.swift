//
//  CharactersListViewController.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

final class CharactersListViewController: UIViewController, HasCustomView {
    typealias CustomView = CharactersListView
    
    let chocolates: BehaviorSubject<[Int]> = BehaviorSubject(value: [])
    
    override func loadView() {
        let customView = CharactersListView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        customView.render()
    }
}
