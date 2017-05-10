//
//  GameRepository.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import RealmSwift

class GameRepository: Object {
    
    dynamic var name = ""
    dynamic var box = ""
    dynamic var logo = ""
    
    dynamic var viewers = 0
    dynamic var channels = 0

//    Specify properties to ignore (Realm won't persist these)
    
//    override static func ignoredProperties() -> [String] {
//      return []
//    }
    
}
