//
//  ViewController.swift
//  TopITunesAlbums
//
//  Created by YAUHENI IVANIUK on 3/1/20.
//  Copyright © 2020 YAUHENI IVANIUK. All rights reserved.
//

import UIKit

class TopListVC: UIViewController {
    
    let tableView = UITableView()
    var albums = [Int]()
    var models: [AlbumModel]?
    
    //MARK: - VC life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        
        for i in 1...10 {
            albums.append(i)
        }
        
        configureTableView()
        
        NetworkManager().getAlbums { [weak self] result in
            switch result {
            case .success(let albums):
                DispatchQueue.main.async {
                    self?.models = albums
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - UI setup
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 56
        tableView.separatorInset = .zero
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TopListCell.self, forCellReuseIdentifier: TopListCell.reuseID)
    }
}

//MARK: - UITableViewDelegate
extension TopListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//MARK: - UITableViewDataSource
extension TopListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let topCell = tableView.dequeueReusableCell(withIdentifier: TopListCell.reuseID, for: indexPath) as? TopListCell else {
            return UITableViewCell()
        }
        guard let album = models?[indexPath.row] else { return UITableViewCell() }
        topCell.set(album: album)
        
        return topCell
    }
    
}

