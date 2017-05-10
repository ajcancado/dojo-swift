//
//  Constants.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit

struct Constants {
    
    struct API {
        static var baseURL: String {
            switch Environment.current {
            case .Development:
                return "https://api.twitch.tv/"
            case .Production:
                return "https://api.twitch.tv/"
            }
        }
    }
    
    struct SessionKeys {
        
        static let environment = "environment"
        
        static let limitOfGames = "limitOfGames"
    }
    
    struct SegueIds {
        
        static let segueToGameDetail = "segueToGameDetail"
    }
    
    struct CellIds{
        
        static let defaultCellId = "CellID"
        
    }
    
    struct Messages {
        
        static let empty = ""
        
        static let ok = "OK"
        
        static let title = "Top 50 Games on Twitch"
        
        static let topMessage = "Dojo Swift"
        
        static let bottomMessage = "You are offline. Connect to internet and make you first request."
    }
    
    struct ServerKeys{
        
        static let clientId = "prk3j0313bpwh961ga9dx4h3wf4mdc"
    }
    
}
