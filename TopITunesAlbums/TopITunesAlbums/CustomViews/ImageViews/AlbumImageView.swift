//
//  AlbumImaggeView.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/3/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class AlbumImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 5
        clipsToBounds = true
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        image = Images.placeholder
    }
}
