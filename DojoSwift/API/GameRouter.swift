//
//  GameRouter.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import Alamofire

enum GameRouter: URLRequestConvertible{
    
    case GetGamesTop([String: Any])
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .GetGamesTop:
            return .get
        }
    }
    
    var path: String {
        switch self {
            
        case .GetGamesTop:
            return "kraken/games/top"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = URL(string: Constants.API.baseURL)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.setValue(Constants.ServerKeys.clientId, forHTTPHeaderField: "Client-ID")
        
        urlRequest.httpMethod = method.rawValue
        
        
        switch self {
        case .GetGamesTop(let parameters):
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        }
    }
}
