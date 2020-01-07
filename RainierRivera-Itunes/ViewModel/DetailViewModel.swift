//
//  DetailViewModel.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

class DetailViewModel: CustomStringConvertible {
    
    private let track: Track
    init(track: Track) {
        self.track = track
    }
    
    var description: String {
        return track.description ?? "No description" // This should be in localized
    }
    
    var navigationTitle: String {
        return track.trackName ?? .empty
    }
}
