//
//  NetworkManager.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let share = NetworkManager()
    
    private init() {}
    
    private let url = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/non-explicit.json"
    
    private let cache = NSCache<NSString, UIImage>()
    
    func getAlbums(completion: @escaping (Result<[AlbumModel], ErrorMessages>) -> Void) {
        
        guard let url = URL(string: url) else {
            fatalError("wrong Url")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
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
    
    func downloadImage(from urlStr: String, completion: @escaping (UIImage?) -> Void){
        
        let cacheKey = NSString(string: urlStr)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data,
                let image = UIImage(data: data) else {
                    completion(nil)
                    return
            }
            
            self?.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
    }
}
