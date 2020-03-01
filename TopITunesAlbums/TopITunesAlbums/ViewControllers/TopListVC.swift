//
//  ViewController.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class TopListVC: UIViewController {

    //MARK: - VC life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    //MARK: - UI setup
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}

