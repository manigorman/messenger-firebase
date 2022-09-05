//
//  TabBarPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol ITabBarPresenter: AnyObject {
    func viewDidLoad()
}

final class TabBarPresenter {
    
    // Dependencies
    weak var view: ITabBarView?
    
    private let router: ITabBarRouter
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(router: ITabBarRouter) {
        self.router = router
    }
    
    // MARK: - Private    
}

// MARK: - ITabBarPresenter

extension TabBarPresenter: ITabBarPresenter {
    func viewDidLoad() {
    }
}
