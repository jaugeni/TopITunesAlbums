//
//  TopListCell.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class TopListCell: UITableViewCell {
    
    static let reuseID = "TopListCell"
    let titleLable = TitleLabel(textAlignment: .left, fontSize: 16)
    let subTitleLable = SubTitleLabel(fontSize: 14)
    let albumImage = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(album: Int) {
        titleLable.text = "Album number \(album)"
        subTitleLable.text = "Artist name \(album)"
    }
    
    private func configure() {
        
        albumImage.backgroundColor = .red
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumImage)
        
        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.distribution = .fill
        vStackView.alignment = .leading
        vStackView.spacing = 0
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        vStackView.addArrangedSubview(titleLable)
        vStackView.addArrangedSubview(subTitleLable)
        contentView.addSubview(vStackView)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            albumImage.heightAnchor.constraint(equalToConstant: 40),
            albumImage.widthAnchor.constraint(equalToConstant: 40),
            albumImage.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 0),
            albumImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 0),
            albumImage.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 0),
            
            vStackView.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 16),
            vStackView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: 0),
            vStackView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 0),
        ])
    }

}
