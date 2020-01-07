//
//  NetworkService.swift
//  rainierrivera
//
//  Created by Rainier Rivera on 07/01/2020.
//  Copyright © 2020 Rainier Rivera. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {

  // Basic alamofire configuration setup
  static var manager: Alamofire.SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30.0
    configuration.urlCache = nil
    return Alamofire.SessionManager(configuration: configuration)
  }()

  // since we are not handling the authentication bearer
  // we leave it empty as default header
  func defaultHeaders() -> [String: String] {
    let headers: [String: String] = [:]
    return headers
  }
}
