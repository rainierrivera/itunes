//
//  TrackCollectionViewCellVCollectionViewCell.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import UIKit

protocol TrackCollectionViewCellDelegate: class {
    func trackTableViewCellDelegate(cell: TrackCollectionViewCell, didFavourite: Bool, track: Track) // true if favourite, false if unfavourite
}

class TrackCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var genreLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var albumImageView: UIImageView!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var favouriteImageView: UIImageView!
    
    weak var delegate: TrackCollectionViewCellDelegate?
    
    private var isFavourite = false {
        didSet {
            let unfavouriteImage = UIImage(named: "like")!
            let favouriteImage = UIImage(named: "liked")!
            favouriteImageView.image = isFavourite ? favouriteImage : unfavouriteImage
        }
    }
    
    private var viewModel: TrackTableViewModel!
    
    func setupViewModel(_ viewModel: TrackTableViewModel) {
        self.viewModel = viewModel
        
        configureViews()
    }
    
    func isFavouriteHidden(_ hidden: Bool) {
        favouriteImageView.isHidden = hidden
    }
    
    @IBAction private func favouriteAction(_ sender: AnyObject) {
        toggleFavourite()
    }
    
    private func toggleFavourite() {
        isFavourite = !isFavourite
        
        delegate?.trackTableViewCellDelegate(cell: self, didFavourite: isFavourite, track: viewModel.track)
    }
    
    private func configureViews() {
        titleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        priceLabel.text = "\(viewModel.price) \(viewModel.currency)"
        
        albumImageView.image = nil
        isFavourite = viewModel.isFavourite
        if let url = URL(string: viewModel.url) {
            albumImageView.af_setImage(withURL: url,
                                       imageTransition: .crossDissolve(0.2))
        }
    }
}
