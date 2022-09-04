//
//  SignInPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

protocol ISignInPresenter: AnyObject {
    func viewDidLoad()
}

final class SignInPresenter {
    
    // Dependencies
    weak var view: ISignInView?
    
    private let router: ISignInRouter
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(router: ISignInRouter) {
        self.router = router
    }
    
    // MARK: - Private
}

// MARK: - ISignInPresenter

extension SignInPresenter: ISignInPresenter {
    func viewDidLoad() {
        print("view did load")
    }
}
