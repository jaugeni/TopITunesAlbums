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
    var viewModel: TopListViewModel
    let loadingSpinner = UIActivityIndicatorView(style: .large)
    
    //MARK: - VC life cycle functions
    init(with viewModel: TopListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        viewModel.albumsLoaded = { [weak self] in
            self?.tableView.reloadData()
            self?.loadingSpinner.removeFromSuperview()
            self?.tableView.isHidden = false
        }
        
        viewModel.errorAppear = { [weak self] message in
            self?.presentAlert(with: "", and: message)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        //Loading spinner fixed during interview 
        configureActivityIndicator()
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
    
    func configureActivityIndicator() {
        view.addSubview(loadingSpinner)
        tableView.isHidden = true
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        loadingSpinner.hidesWhenStopped = true
        loadingSpinner.translatesAutoresizingMaskIntoConstraints = true
        loadingSpinner.startAnimating()

        loadingSpinner.center = view.center
    }
}

//MARK: - UITableViewDataSource
extension TopListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albumsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let topCell = tableView.dequeueReusableCell(withIdentifier: TopListCell.reuseID, for: indexPath) as? TopListCell else {
            return UITableViewCell()
        }
        
        topCell.set(album: viewModel.album(for: indexPath))
        return topCell
    }
    
}

//MARK: - UITableViewDelegate
extension TopListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsVC(with: viewModel.album(for: indexPath))
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

