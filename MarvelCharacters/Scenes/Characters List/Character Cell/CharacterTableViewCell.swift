//
//  CharacterTableViewCell.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 30/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit
import SnapKit

class CharacterTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String { return String.init(describing: self) }

    private var characterImageView = UIImageView() {
        $0.contentMode = .scaleAspectFill
        $0.layer.borderWidth = 1
        $0.layer.masksToBounds = false
        $0.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    private var characterNameLabel = UILabel() {
        $0.numberOfLines = 0
        $0.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    }
    private var characterDescriptionLabel = UILabel() {
        $0.numberOfLines = 0
    }
    
    private var viewModel: CharacterTableViewCellViewModelProtocol?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(#file) \(#function) not implemented")
    }
    
    private func render() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterDescriptionLabel)
        
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(16).priority(500)
            make.bottom.equalTo(contentView.snp.bottom).inset(16).priority(500)
            make.centerY.equalToSuperview()
            make.leading.equalTo(contentView.snp.leading).inset(20)
            make.width.equalTo(100)
            make.height.equalTo(80)
        }
        
        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(16)
            make.leading.equalTo(characterImageView.snp.trailing).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).inset(20)
        }
        
        characterDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel.snp.bottom).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).inset(16)
            make.leading.equalTo(characterImageView.snp.trailing).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).inset(20)
        }
    }
    
    func configure(with viewModel: CharacterTableViewCellViewModelProtocol) {
        self.viewModel = viewModel
        if let data = viewModel.imageData {
            characterImageView.image = UIImage(data: data)
        }
        characterNameLabel.text = viewModel.name
        characterDescriptionLabel.text = viewModel.description
    }
}
