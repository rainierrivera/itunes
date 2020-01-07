//
//  FavouriteViewModel.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

class FavouriteViewModel {
    
    private let appManager: AppManager
    private var favouriteTrack: FavouriteTrack?
    
    init(appUserDefaultManager: AppManager = .shared) {
        self.appManager = appUserDefaultManager
        
        favouriteTrack = appManager.retrieveFavouriteTrack()
    }
    
    var numberOfRows: Int {
        return favouriteTrack?.tracks.count ?? 0
    }
    
    var numberOfSection: Int {
        return 1
    }
    
    var navigationTitle: String {
        return "Favourites" // This should be in localized
    }
    
    func trackIn(row: Int) -> Track {
        return favouriteTrack!.tracks[row] // We are sure that we have tracks since we are getting it on cell row
    }
    
}
