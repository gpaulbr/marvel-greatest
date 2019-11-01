//
//  CharactersListView.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

final class CharactersListView: UIView {
    
    let usernameLabel = UILabel() {
        $0.text = "Characters"
        $0.textColor = #colorLiteral(red: 1, green: 0.5176470588, blue: 0.1490196078, alpha: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#file) \(#function) not implemented")
    }
    
    func render() {
        addSubview(usernameLabel)
        
        usernameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
