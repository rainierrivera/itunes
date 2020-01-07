//
//  ItunesService.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

// Use this service for getting API specifically for itunes
struct ItunesService {
    private let networkManager : NetworkManager
    
    init(networkManager: NetworkManager = .init()) {
        self.networkManager = networkManager
    }
}

extension ItunesService: ItunesAPI {
    func getTrackList(completion: @escaping (APIResponse<TrackResponse>) -> Void) {
        GetItunesTrackListRequest(withNetworkManager: networkManager).request(completion: completion)
    }
}
