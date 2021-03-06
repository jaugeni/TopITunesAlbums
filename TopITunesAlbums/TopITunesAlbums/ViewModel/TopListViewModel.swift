//
//  TopListViewModel.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/3/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class TopListViewModel {
    
    var albumsModel: [AlbumModel] = []
    
    var albumsLoaded: (() -> Void)?
    var errorAppear: ((String) -> Void)?
    
     var albumsCount: Int {
        return albumsModel.count
    }
    
    private let networkManager = NetworkManager.share
    
    init() {
        loadAlbums()
    }
    
    private func loadAlbums() {
        networkManager.getAlbums { [weak self] result in
            switch result {
            case .success(let albums):
                self?.albumsModel = albums
                DispatchQueue.main.async {
                    self?.albumsLoaded?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorAppear?(error.rawValue)
                }
            }
        }
    }
    
    func album(for indexPath: IndexPath) -> AlbumModel {
        return albumsModel[indexPath.row]
    }
}
