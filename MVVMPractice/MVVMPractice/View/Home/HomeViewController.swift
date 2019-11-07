//
//  ViewController.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gameLibrary: GameLibrary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction
    
    @IBAction func didTouchAddGameButton(_ sender: UIBarButtonItem) {
        presentGameProducerViewController()
    }
    
    // MARK: Private
    
    fileprivate func showGameScoreboardEditorViewController() {
        guard let gameLibrary = gameLibrary else { return }
        
        if let game = gameLibrary.allGames().first {
            let controller = UIStoryboard.loadGameScoreboardEditorViewController()
            let viewModel = GameScoreboardEditorViewModelFromGame(withGame: game)
            
            controller.viewModel = viewModel
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    fileprivate func presentGameProducerViewController() {
        if !self.isViewLoaded { return }
        
        let controller = UIStoryboard.loadGameProducerViewController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameLibrary?.allGames().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameListCell", for: indexPath) as? GameListCell else { return UITableViewCell() }
        
        if let game = gameLibrary?.allGames()[indexPath.row] {
            cell.bind(game)
        }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showGameScoreboardEditorViewController()
    }
}

extension HomeViewController: CreatedNewGame {
    func created(_ game: Game) {
        gameLibrary?.addGame(game)
        tableView?.reloadData()
    }
}
