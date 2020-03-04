//
//  FilledButton.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/4/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class FilledButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius  = 10
        titleLabel?.font    = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
