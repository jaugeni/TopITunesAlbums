//
//  UIViewController+AlertVC.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/4/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            self.dismiss(animated: true)
        }
        alertController.addAction(okAction)
    }
}
