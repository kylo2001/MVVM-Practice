//
//  GameProducerViewController.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import UIKit

class GameProducerViewController: UIViewController, DismissableForTapGesture {
    
    @IBOutlet weak var homeTeamProducerView: CreateTeamInfomationView!
    @IBOutlet weak var awayTeamProducerView: CreateTeamInfomationView!

    var gameLibrary: GameLibrary?
    
    weak var delegate: CreatedNewGame?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGesture()
    }
    
    @IBAction func didTouchDoneButton(_ sender: UIButton) {
        if let game = createNewGame() {
            // "성공적으로 게임을 생성하였습니다" Alert
            delegate?.created(game)
            dismiss(animated: true, completion: nil)
        } else {
            // "정보를 기입해주세요" Alert
        }
    }
    
    @IBAction func didTouchCancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func createNewGame() -> Game? {
        guard let homeTeamName = homeTeamProducerView.viewModel?.teamName else { return nil }
        guard let homePlayers = homeTeamProducerView.viewModel?.players else { return nil }
        guard let awayteamName = awayTeamProducerView.viewModel?.teamName else { return nil }
        guard let awayPlayers = awayTeamProducerView.viewModel?.players else { return nil }
        
        let homeTeam = Team(name: homeTeamName, identifier: UUID().uuidString)
        for player in homePlayers {
            homeTeam.addPlayer(player)
        }
        
        let awayTeam = Team(name: awayteamName, identifier: UUID().uuidString)
        for player in awayPlayers {
            awayTeam.addPlayer(player)
        }
        
        let game = Game(homeTeam: homeTeam, awayTeam: awayTeam, identifier: UUID().uuidString)
        
        return game
    }
}

protocol DismissableForTapGesture: class {
    func setTapGesture()
}

extension DismissableForTapGesture where Self: UIViewController {
    func setTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}

protocol CreatedNewGame: class {
    func created(_ game: Game)
}
