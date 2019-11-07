//
//  GameProducerViewModel.swift
//  MVVMPractice
//
//  Created by DongWhan on 2019/11/07.
//  Copyright © 2019 Kim DongHwan. All rights reserved.
//

import Foundation

protocol GameProducerViewModel {
    var homeTeam: CreateTeamInformationViewModel { get }
    var awayTeam: CreateTeamInformationViewModel { get }
    init()
}

extension GameProducerViewModel {
    init() {
        self.init()
    }
}
