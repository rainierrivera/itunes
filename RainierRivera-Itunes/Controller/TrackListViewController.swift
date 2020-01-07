//
//  ViewController.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//


import UIKit

class TrackListViewController: UIViewController {

    var viewModel: TrackListViewModel!
    
    private struct Constants {
        static let identifier = "TrackCollectionViewCell"
    }
    
    @IBOutlet weak private var collectionView: UICollectionView!
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        configureNavigationBar()
        configureCollectionView()
        
        viewModel.getTrackList { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    override func viewWillLayoutSubviews() {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    // MARK: Actions
    @IBAction private func favouriteAction(_ sender: AnyObject) {
        guard let favouriteViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesViewController") as? FavouritesViewController else {
            return
        }
        
        let favouriteViewModel = FavouriteViewModel()
        favouriteViewController.viewModel = favouriteViewModel
        
        navigationController?.pushViewController(favouriteViewController, animated: true)
    }
    
    // MARK: Private method
    
    private func setupViewModel() {
        self.viewModel = TrackListViewModel()
    }
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = viewModel.navigationTitle
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let trackCell = UINib(nibName: Constants.identifier, bundle: nil)
        collectionView.register(trackCell, forCellWithReuseIdentifier: Constants.identifier)
    }
    
}

extension TrackListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifier, for: indexPath) as? TrackCollectionViewCell else {
            fatalError()
        }

        let track = viewModel.trackIn(row: indexPath.row)

        let viewModel = TrackTableViewModel(track: track)
        cell.setupViewModel(viewModel)
        cell.delegate = self
        return cell
            
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let detailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        let track = viewModel.trackIn(row: indexPath.row)
        let viewModel = DetailViewModel(track: track)

        detailViewController.viewModel = viewModel
        splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}

extension TrackListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.width, height: 123)
    }
    

}

extension TrackListViewController: TrackCollectionViewCellDelegate {
    func trackTableViewCellDelegate(cell: TrackCollectionViewCell, didFavourite: Bool, track: Track) {
        viewModel.favouriteTrack(didFavourite, track: track)
    }

}
