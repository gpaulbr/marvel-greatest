//
//  AppRootViewController.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit
import SnapKit

/** The app's root controller - a `UIViewController` which simply holds a child `UIViewController`. */

final class AppRootViewController: UIViewController {
    
    func set(childViewController controller: UIViewController) {
        addChild(controller)
        controller.didMove(toParent: self)

        let childView = controller.view!
        view.addSubview(childView)
        
        childView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }
    
}
