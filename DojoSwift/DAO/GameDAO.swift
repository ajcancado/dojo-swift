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
        
        let gameRepository = GameRepository()
        
        gameRepository.name = game.name
        gameRepository.box = game.box
        gameRepository.logo = game.logo
        gameRepository.viewers = game.viewers
        gameRepository.channels = game.channels
        
        try! realm.write {
            realm.add(gameRepository)
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
            
            let game = Game()
            
            game.name = gameRepository.name
            game.box = gameRepository.box
            game.logo = gameRepository.logo
            game.viewers = gameRepository.viewers
            game.channels = gameRepository.channels
            
            games.append(game)
            
        }
        return games
    }

}
