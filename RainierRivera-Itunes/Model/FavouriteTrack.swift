//
//  FavouriteTrack.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

class FavouriteTrack: Codable {
    var tracks: [Track]
    
    init(tracks: [Track]) {
        self.tracks = tracks
    }
}
