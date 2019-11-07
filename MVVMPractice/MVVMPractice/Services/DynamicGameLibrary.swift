//
//  DynamicGameLibrary.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import Foundation

class DynamicGameLibrary: NSObject, GameLibrary {
    
    fileprivate var games: [Game] = []
    
    override init() {
        super.init()
        
    }
    
    // MARK: GameLibrary Protocol
    
    func allGames() -> [Game] {
        return games
    }
    
    func addGame(_ game: Game) {
        for currentGame in games {
            if currentGame.identifier == game.identifier {
                return
            }
        }
        
        games.append(game)
        NotificationCenter.default.post(notification(GameLibraryNotifications.GameLibraryGameAdded, game: game))
    }
    
    func removeGame(_ game: Game) {
        var indexToRemove: Int?
        for index in 0...games.count-1 {
            let currentGame = games[index]
            if currentGame.identifier == game.identifier {
                indexToRemove = index
                break
            }
        }
        
        if let indexToRemove = indexToRemove {
            games.remove(at: indexToRemove)
            NotificationCenter.default.post(notification(GameLibraryNotifications.GameLibraryGameRemoved, game: game))
        }
    }
    
    func updateGame(_ game: Game) {
        var existingGame: Game?
        for currentGame in games {
            if currentGame.identifier == game.identifier {
                existingGame = currentGame
                break
            }
        }
        
        if let existingGame = existingGame {
            existingGame.homeTeam = game.homeTeam
            existingGame.awayTeam = game.awayTeam
            existingGame.homeTeamScore = game.homeTeamScore
            existingGame.awayTeamScore = game.awayTeamScore
            
            NotificationCenter.default.post(notification(GameLibraryNotifications.GameLibraryGameUpdated, game: existingGame))
        }
    }
    
    // MARK: Private
    
    fileprivate func notification(_ name: String, game: Game) -> Notification {
        let notification: Notification = Notification(name: Notification.Name(rawValue: name), object: self, userInfo: ["game" : game])
        
        return notification
    }
    
}

