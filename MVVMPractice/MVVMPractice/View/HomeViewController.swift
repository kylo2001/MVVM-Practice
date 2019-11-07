//
//  ViewController.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var gameLibrary: GameLibrary? {
        didSet {
            showGameScoreboardEditorViewController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showGameScoreboardEditorViewController()
    }
    
    // MARK: Private
    
    fileprivate func showGameScoreboardEditorViewController() {
        if !self.isViewLoaded { return }
        guard let gameLibrary = gameLibrary else { return }
        
        if let game = gameLibrary.allGames().first {
            let controller = UIStoryboard.loadGameScoreboardEditorViewController()
            let viewModel = GameScoreboardEditorViewModelFromGame(withGame: game)
            
            controller.viewModel = viewModel
            self.insertChildController(controller, intoParentView: self.view)
        }
    }
}
