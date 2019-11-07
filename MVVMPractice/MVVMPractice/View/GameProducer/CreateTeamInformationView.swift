//
//  CreateTeamInformationView.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import UIKit

class CreateTeamInfomationView: UIView {
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var player1NameTextField: UITextField!
    @IBOutlet weak var player2NameTextField: UITextField!
    @IBOutlet weak var player3NameTextField: UITextField!
    
    fileprivate weak var informationNibView: UIView!
    
    var viewModel: CreateTeamInformationViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let informationView: UIView = UINib.loadSingleView("CreateTeamInformationView", owner: self)
        self.addSubview(informationView)
        self.informationNibView = informationView
        
        viewModel = CreateTeamInformationViewModelImpl()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        informationNibView.frame = self.bounds
    }
}

extension CreateTeamInfomationView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = textField.text, name != "" {
            if textField.tag == 0 {
                viewModel?.teamName = name
            } else {
                let player = Player(name: name, identifier: UUID().uuidString)
                viewModel?.players.append(player)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
}
