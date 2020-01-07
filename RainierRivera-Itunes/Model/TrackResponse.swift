//
//  TrackResponse.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

// Using Quicktype
// https://quicktype.io
struct TrackResponse: Codable {
    let results: [Track]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

class Track: Codable {
    var trackName: String?
    var collectionName: String?
    let artworkURL: String?
    var priceTrack: Double?
    let priceCollection: Double?
    let currency: String?
    let genre: String?
    let description: String?
    var trackId: Int?
    var isFavourite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case trackName
        case collectionName
        case artworkURL = "artworkUrl100"
        case priceTrack = "trackPrice"
        case priceCollection = "collectionPrice"
        case currency
        case genre = "primaryGenreName"
        case description = "longDescription"
        case trackId
    }
    
    // for testing purposes
    init(trackName: String, collectionName: String, priceTrack: Double, trackId: Int) {
        self.trackName = trackName
        self.collectionName = collectionName
        self.priceTrack = priceTrack
        self.trackId = trackId
        self.artworkURL = ""
        self.priceCollection = 0.00
        self.currency = ""
        self.isFavourite = false
        self.description = ""
        self.genre = ""
    }
}
