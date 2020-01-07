//
//  Track.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//


import Foundation

class TrackListViewModel {
    
    private let networkService: ItunesAPI
    private let appUserManager: AppManager
    init(networkService: ItunesAPI = ItunesService(), appUserDefault: AppManager = .shared) {
        self.networkService = networkService
        self.appUserManager = appUserDefault
    }
    
    private struct Constants {
        static let title = "iTunes Track List" // this should be in Localized String
    }
    
    private var tracks = [Track]()
    
    var numberOfRows: Int {
        return tracks.count
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    var navigationTitle: String {
        return Constants.title
    }
    
    func favouriteTrack(_ favourite: Bool, track: Track) {
        if favourite {
            appUserManager.favourite(track)
        } else {
            appUserManager.unFavourite(track)
        }
    }
    
    func trackIn(row: Int) -> Track {
        return tracks[row]
    }
    
    private func favouriteTracks() {
        guard let favouriteTracks = appUserManager.retrieveFavouriteTrack() else { return }
        favouriteTracks.tracks.forEach({ favouriteTrack in
            let favouriteTrack = tracks.first(where: {$0.trackId == favouriteTrack.trackId})
            favouriteTrack?.isFavourite = true
        })
        
    }
    
    func getTrackList(completion: @escaping () -> Void) {
        networkService.getTrackList { (response) in
            switch response {
            case let .success(trackResponse):
                self.tracks = trackResponse.results
                self.favouriteTracks()
            case .error(_): break
            }
            completion()
        }
    }
}
