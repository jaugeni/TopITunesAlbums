//
//  NetworkManager.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case error
    case invalidData
}


class NetworkManager {
    
    private let url = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/non-explicit.json"
    
    func getAlbums(completion: @escaping (Result<[AlbumModel], NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.error))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let feed = try decoder.decode(FeedModel.self, from: data)
                let albumsModel = feed.feed.results
                completion(.success(albumsModel))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
