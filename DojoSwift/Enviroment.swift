//
//  Enviroment.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit

enum Environment: Int {
    case Development
    case Production
}

extension Environment {
    
    static var current: Environment {
        
        get {
            return Environment(rawValue: UserDefaults.standard.integer(forKey: Constants.SessionKeys.environment))!
        }
        set (val) {
            UserDefaults.standard.set(val.hashValue, forKey: Constants.SessionKeys.environment)
        }
    }
}
