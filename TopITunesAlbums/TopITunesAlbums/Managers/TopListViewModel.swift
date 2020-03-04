//
//  TopListViewModel.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/3/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class TopListViewModel {
    
    private var albumsModel: [AlbumModel] = []
    
    var albumsLoaded: (() -> Void)?
    
     var albumsCount: Int {
        return albumsModel.count
    }
    
    private let networkManager = NetworkManager()
    
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
                print(error)
            }
        }
    }
    
    func album(for indexPath: IndexPath) -> AlbumModel {
        return albumsModel[indexPath.row]
    }
    
    func getImage(forr artworkUrl: String, completion: @escaping (UIImage?) -> Void) {
        networkManager.downloadImage(from: artworkUrl) { (image) in
            DispatchQueue.main.async {
                if let image = image  {
                    completion(image)
                    return
                }
                completion(Images.placeholder)
            }
        }
    }
}