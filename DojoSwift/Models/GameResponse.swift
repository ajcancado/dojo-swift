//
//  GameResponse.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import ObjectMapper

class GameResponse: Mappable {
    
    var links: [String]!
    var total: Int!
    var games: [Game]!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        links               <- map["_links"]
        total               <- map["_total"]
        games               <- map["top"]
        
    }
    
}
