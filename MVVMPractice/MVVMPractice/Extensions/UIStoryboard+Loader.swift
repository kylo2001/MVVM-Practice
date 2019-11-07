//
//  UIStoryboard+Loader.swift
//  MVVMExample
//
//  Created by Dino Bartosak on 18/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

fileprivate enum Storyboard : String {
    case main = "Main"
    case gameScoreboardEditor = "GameScoreboardEditor"
    case gameProducer = "GameProducer"
}

fileprivate extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: App View Controllers

extension UIStoryboard {
    static func loadGameScoreboardEditorViewController() -> GameScoreboardEditorViewController {
        load(from: .gameScoreboardEditor, identifier: "GameScoreboardEditorViewController") as! GameScoreboardEditorViewController
    }
    
    static func loadGameProducerViewController() -> GameProducerViewController {
        load(from: .gameProducer, identifier: "GameProducerViewController") as! GameProducerViewController
    }
}
