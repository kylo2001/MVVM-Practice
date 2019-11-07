//
//  GameListCell.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import UIKit

class GameListCell: UITableViewCell {

    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension GameListCell: bindable {
    typealias dataType = Game
    
    func bind(_ data: Game) {
        homeTeamNameLabel.text = data.homeTeam.name
        awayTeamNameLabel.text = data.awayTeam.name
        homeTeamScoreLabel.text = String(data.homeTeamScore)
        awayTeamScoreLabel.text = String(data.awayTeamScore)
    }
}

protocol bindable {
    associatedtype dataType
    func bind(_ data: dataType)
}
