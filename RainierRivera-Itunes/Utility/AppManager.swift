//
//  AppManager.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//


import Foundation

class AppManager {
    static let shared = AppManager()
    
    func favourite(_ track: Track) {
        if let favouriteTrack = retrieveFavouriteTrack() {
            favouriteTrack.tracks.append(track)
            saveFavourite(favouriteTrack)
        } else {
            // this is the first time we like a track
            var tracks = [Track]()
            tracks.append(track)
            let favouritetrack = FavouriteTrack(tracks: tracks)
            saveFavourite(favouritetrack)
        }
    }
    
    func unFavourite(_ track: Track) {
        guard let favouriteTrack = retrieveFavouriteTrack() else { return }
        if let trackIndex = favouriteTrack.tracks.firstIndex(where: { $0.trackId == track.trackId }) {
            favouriteTrack.tracks.remove(at: trackIndex)
            saveFavourite(favouriteTrack)
        }
    }
    
    private func saveFavourite(_ favouriteTrack: FavouriteTrack) {
        let favouriteTrack = try! JSONEncoder().encode(favouriteTrack)
        UserDefaults.standard.set(favouriteTrack, forKey: "tracks")
    }
    
    func retrieveFavouriteTrack() -> FavouriteTrack? {
        let favouriteDataOptional = UserDefaults.standard.data(forKey: "tracks")
        guard let favouriteData = favouriteDataOptional else {
            return nil
        }
        let favouriteTracks = try! JSONDecoder().decode(FavouriteTrack.self, from: favouriteData)
        return favouriteTracks
    }
}
