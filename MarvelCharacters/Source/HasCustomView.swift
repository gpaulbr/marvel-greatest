//
//  HasCustomView.swift
//  MarvelCharacters
//
//  Created by Gabriel Paul on 23/10/19.
//  Copyright © 2019 GabrielPaul. All rights reserved.
//

import UIKit

// *******************************
// MARK: - HasCustomView
// *******************************

/// Defines a customView property for a `UIViewController` to be used in exchange of the regular view property.
///
/// In order for this to work, you have to provide a custom view to your `UIViewController` at the loadView() method.

public protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    /// The UIViewController's custom view.
    public var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return customView
    }
}
