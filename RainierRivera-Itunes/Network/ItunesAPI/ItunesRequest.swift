//
//  ItunesRequest.swift
//  RainierRivera-Itunes
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation
import Alamofire

final class GetItunesTrackListRequest: ManagedRequest {
    override func requestURL() -> URLConvertible {
        return "https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all"
    }
}
