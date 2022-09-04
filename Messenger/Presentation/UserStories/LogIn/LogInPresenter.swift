//
//  LogInPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

protocol ILogInPresenter: AnyObject {
    func viewDidLoad()
    func didTapRegister()
}

final class LogInPresenter {
    
    // Dependencies
    weak var view: ILogInView?
    
    private let router: ILogInRouter
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(router: ILogInRouter) {
        self.router = router
    }
    
    // MARK: - Private
}

// MARK: - ILogInPresenter

extension LogInPresenter: ILogInPresenter {
    
    func viewDidLoad() {
        print("view did load")
    }
    
    func didTapRegister() {
        router.openSignIn()
    }
}
