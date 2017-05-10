//
//  GameDAO.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import RealmSwift

class GameDAO: NSObject {
    
    let realm = try! Realm()
    
    func saveGames(games: [Game]) {
        
        for game in games {
            
            saveGame(game: game)
        }
    }
    
    func saveGame(game: Game){
        
        try! realm.write {
            realm.add(game.toGameRepository())
        }
    }
    
    func deleteGames(){
        
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func getAll() -> [Game] {
        
        let gamesRespositories = realm.objects(GameRepository.self)
        
        var games: [Game] = []
        
        for gameRepository in gamesRespositories {
            
            games.append(gameRepository.toGame())
        }
        
        return games
    }

}
