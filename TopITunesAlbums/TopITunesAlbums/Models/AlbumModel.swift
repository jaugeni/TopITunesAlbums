//
//  AlbumModel.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

struct AlbumModel: Codable {
    
    let name: String
    let artistName: String
    let artworkUrl100: String
    let genres: [GenresModel]
    let releaseDate: String
    let copyright: String
    let url: String
    
}

struct GenresModel: Codable {
    
    let name: String
    
}

extension AlbumModel {
    
    func getImage(completion: @escaping (UIImage?) -> Void) {
        NetworkManager.share.downloadImage(from: artworkUrl100) { image in
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    var genre: String {
        return genres[0].name
    }
    
}

