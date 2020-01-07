//
//  TrackListViewModelSpec.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import RainierRivera_Itunes

// This is just a sample unit test
final class TrackListSpec: QuickSpec {
    override func spec() {
        super.spec()
        
        describe("Given a TrackListViewModel") {
            let mockAPI = MockItunesAPI()
            let trackListViewModel = TrackListViewModel(networkService: mockAPI, appUserDefault: .shared)
            trackListViewModel.getTrackList {
                // getting new mock tracks
            }
            
            context("When there are track items") {
                it("Then it should have track items") {
                    expect(trackListViewModel.numberOfRows).notTo(equal(0))
                }
                
                it("Then it should have correct number of sections") {
                    expect(trackListViewModel.numberOfSections).to(equal(1))
                }
            }
        }
    }
}

