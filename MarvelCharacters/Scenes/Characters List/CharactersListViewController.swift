//
//  CharactersListViewController.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit
import RxSwift

final class CharactersListViewController: UIViewController, HasCustomView {
    typealias CustomView = CharactersListView
    
    private var viewModel: CharactersListViewModelProtocol
    private var tableView: UITableView { return customView.tableView }
    
    init(viewModel: CharactersListViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#file) \(#function) not implemented")
    }
    
    override func loadView() {
        let customView = CharactersListView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Marvel Characters"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.delegate = self
        
        customView.render()
        
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        viewModel.fetchQuestion()
    }

}

// Mark: - View Model Delegate

extension CharactersListViewController: CharactersListViewModelDelegate {
    func charactersListDidUpdate() {
        customView.tableView.reloadData()
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier) as? CharacterTableViewCell else {
          return UITableViewCell()
        }
        let cellViewModel = CharacterTableViewCellViewModel(character: viewModel.characters[indexPath.row])
        cell.configure(with: cellViewModel)
        
        return cell
    }
    
    
}
