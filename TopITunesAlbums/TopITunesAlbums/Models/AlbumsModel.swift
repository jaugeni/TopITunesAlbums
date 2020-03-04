//
//  AlbumsModel.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import Foundation

struct FeedModel: Codable {
    
    let feed: AlbumsModel
    
}

struct AlbumsModel: Codable {
    
    let results: [AlbumModel]
    
}
