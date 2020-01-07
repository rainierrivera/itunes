//
//  MockItunesAPI.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

class MockItunesAPI: ItunesAPI {
    func getTrackList(completion: @escaping (APIResponse<TrackResponse>) -> Void) {
        completion(.success(TrackFactory.makeTrack()))
    }
}
