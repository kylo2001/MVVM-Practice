//
//  CreateTeamInformationViewModel.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import Foundation

protocol CreateTeamInformationViewModel {
    var teamName: String { get set }
    var players: [Player] { get  set }
}

class CreateTeamInformationViewModelImpl: CreateTeamInformationViewModel {
    var teamName: String
    var players: [Player]
    
    init() {
        teamName = ""
        players = []
    }
}
