//
//  GamesProvider.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation
import Alamofire

typealias GetGamesCompletion = (_ games: [Game]) -> Void

struct GamesProvider {
    
    static func getGames(completion: GetGamesCompletion) -> Void {
        
        var gameList: [Game] = []
        
        let headers: HTTPHeaders = [
            "Client-ID": Constants.ServerKeys.clientId
        ]
        
        Alamofire.request(Constants.API.baseURL, headers: headers).responseJSON { (resp:DataResponse<Any>) in
            
            print(resp)
            
            
            
        }
        
        completion(gameList)
        
    }
}
