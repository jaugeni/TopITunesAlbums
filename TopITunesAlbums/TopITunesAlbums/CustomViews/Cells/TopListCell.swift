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
    let titleLable = TitleLabel(textAlignment: .left, fontSize: 14)
    let subTitleLable = SubTitleLabel(fontSize: 12)
    let albumImageView = AlbumImaggeView(frame: .zero)
    let vStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        vStackView.addArrangedSubview(titleLable)
        vStackView.addArrangedSubview(subTitleLable)
        contentView.addSubview(albumImageView)
        contentView.addSubview(vStackView)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(album: AlbumModel, with viewModel: TopListViewModel) {
        titleLable.text = album.name
        subTitleLable.text = album.artistName
        viewModel.getImage(forr: album.artworkUrl100) { [weak self] image in
            self?.albumImageView.image = image
        }
    }
    
    private func configure() {
        configureVStackView()
        configureConstrains()
    }
    
    func configureVStackView() {
        vStackView.axis = .vertical
        vStackView.distribution = .fillProportionally
        vStackView.alignment = .leading
        vStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConstrains() {
        
        NSLayoutConstraint.activate([
            
            albumImageView.heightAnchor.constraint(equalToConstant: 40),
            albumImageView.widthAnchor.constraint(equalToConstant: 40),
            albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            
            vStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStackView.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 16),
            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
}
