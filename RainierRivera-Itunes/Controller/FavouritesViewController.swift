//
//  FavouritesViewController.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//


import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak private var tableView: UITableView!
    
    var viewModel: FavouriteViewModel!
    
    private struct Constants {
        static let identifier = "TrackTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindViewModel()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let trackCell = UINib(nibName: Constants.identifier, bundle: nil)
        tableView.register(trackCell, forCellReuseIdentifier: Constants.identifier)
    }
    
    private func bindViewModel() {
        navigationItem.title = viewModel.navigationTitle
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as? TrackTableViewCell else {
            fatalError()
        }
        
        let track = viewModel.trackIn(row: indexPath.row)
        
        let viewModel = TrackTableViewModel(track: track)
        cell.setupViewModel(viewModel)
        cell.isFavouriteHidden(true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let detailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        
        let track = viewModel.trackIn(row: indexPath.row)
        let viewModel = DetailViewModel(track: track)
        
        detailViewController.viewModel = viewModel
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

