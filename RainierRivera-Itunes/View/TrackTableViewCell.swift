//
//  TrackTableViewCell.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import UIKit
import AlamofireImage

struct TrackTableViewModel {
    var title: String {
        return track.trackName ?? .empty
    }
    var genre: String {
        return track.genre ?? .empty
    }
    var price: String {
        return String(describing: track.priceTrack ?? 0.00)
    }
    var url: String {
        return track.artworkURL ?? .empty
    }

    var currency: String {
        return track.currency ?? "USD" // USD Should be in localized
    }

    var isFavourite: Bool {
        return track.isFavourite ?? false
    }

    var track: Track
    init(track: Track) {
        self.track = track
    }
}

protocol TrackTableViewCellDelegate: class {
    func trackTableViewCellDelegate(cell: TrackTableViewCell, didFavourite: Bool, track: Track) // true if favourite, false if unfavourite
}

class TrackTableViewCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var genreLabel: UILabel!
    @IBOutlet weak private var priceLabel: UILabel!
    @IBOutlet weak private var albumImageView: UIImageView!
    @IBOutlet weak private var likeButton: UIButton!
    @IBOutlet weak private var favouriteImageView: UIImageView!

    weak var delegate: TrackTableViewCellDelegate?

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
