//
//  DetailVC.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/3/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    var album: AlbumModel
    let padding: CGFloat = 16
    
    private let albumImageView = AlbumImageView(frame: .zero)
    private let copyrightLabel = SubTitleLabel(fontSize: 10)
    private let albumNameLabel = TitleLabel(textAlignment: .left, fontSize: 16)
    private let artistNameLabel = SubTitleLabel(fontSize: 14)
    private let genreReliseLabel = SubTitleLabel(fontSize: 12)
    private let vStackView = UIStackView()
    
    //MARK: - VC life cycle functions
    init(with album: AlbumModel) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureImageView()
        configureCopyrightLabel()
        configureAlbumLabel()
        configureArtistLabel()
        configureGenreReliseLabel()
        configureVStackView()
    }
    
    //MARK: - UI setup
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.title = "Top List"
    }
    
    private func configureImageView() {
        view.addSubview(albumImageView)
        
        album.getImage { [weak self] image in
            self?.albumImageView.image = image
        }
                
        let size = view.bounds.width / 1.6
        
        NSLayoutConstraint.activate([
            albumImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumImageView.heightAnchor.constraint(equalToConstant: size),
            albumImageView.widthAnchor.constraint(equalToConstant: size)
        ])
    }
    
    private func configureCopyrightLabel() {
        view.addSubview(copyrightLabel)
        copyrightLabel.text = album.copyright
        copyrightLabel.textAlignment = .center
        copyrightLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            copyrightLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 8),
            copyrightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            copyrightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func configureAlbumLabel() {
        albumNameLabel.text = album.name
        albumNameLabel.numberOfLines = 0
    }
    
    func configureArtistLabel() {
        artistNameLabel.text = album.artistName
        artistNameLabel.numberOfLines = 0
    }
    
    func configureGenreReliseLabel() {
        genreReliseLabel.text = album.genre + " ・ " + album.releaseDate
    }
    
    func configureVStackView() {
        vStackView.addArrangedSubview(albumNameLabel)
        vStackView.addArrangedSubview(artistNameLabel)
        vStackView.addArrangedSubview(genreReliseLabel)
        view.addSubview(vStackView)
        
        vStackView.axis = .vertical
        vStackView.distribution = .fill
        vStackView.alignment = .leading
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: copyrightLabel.bottomAnchor, constant: padding),
            vStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            vStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    
}
