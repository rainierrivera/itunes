//
//  TrackFactory.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//


import Foundation

struct TrackFactory {
    static func makeTrack() -> TrackResponse {
        
        let track1 = Track(trackName: "Sample", collectionName: "Sample collectionName", priceTrack: 9.99, trackId: 0)
        let track2 = Track(trackName: "Sample 2", collectionName: "Sample collectionName", priceTrack: 9.99, trackId: 1)
        let track3 = Track(trackName: "Sample 3", collectionName: "Sample collectionName", priceTrack: 9.99, trackId: 2)
        let track4 = Track(trackName: "Sample 4", collectionName: "Sample collectionName", priceTrack: 9.99, trackId: 3)
        
        return TrackResponse(results: [track1, track2, track3, track4])
    }
}
