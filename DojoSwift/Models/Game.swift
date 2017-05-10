//
//  Game.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import ObjectMapper

class Game: Mappable {
    
    var name: String!
    var box: String!
    var logo: String!
    
    var viewers: Int!
    var channels: Int!
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        name                <- map["game.name"]
        box                 <- map["game.box.template"]
        logo                <- map["game.logo.template"]
        viewers             <- map["viewers"]
        channels            <- map["channels"]
    }
    
    func getBoxWith(width: CGFloat, andHeight height: CGFloat) -> String{
        
        var boxEdited = box.replacingOccurrences(of: "{width}", with: "\(Int(width))")
        boxEdited = boxEdited.replacingOccurrences(of: "{height}", with: "\(Int(height))")
        
        return boxEdited
        
    }
    
    func getLogoWith(width: CGFloat, andHeight height: CGFloat) -> String{
        
        var logoEdited = logo.replacingOccurrences(of: "{width}", with: "\(Int(width))")
        logoEdited = logoEdited.replacingOccurrences(of: "{height}", with: "\(Int(height))")
        
        return logoEdited
        
    }
    
    func toGameRepository() -> GameRepository {
        
        let gameRepository = GameRepository()
        
        gameRepository.name = self.name
        gameRepository.box = self.box
        gameRepository.logo = self.logo
        gameRepository.viewers = self.viewers
        gameRepository.channels = self.channels
        
        return gameRepository
    }
}
