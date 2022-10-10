//
//  LogInPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit
import FirebaseAuth

protocol ILogInPresenter: AnyObject {
    func viewDidLoad()
    func didTapLogIn(email: String, password: String)
    func didTapRegister()
}

final class LogInPresenter {
    
    // Dependencies
    weak var view: ILogInView?
    
    private let router: ILogInRouter
    
    private let validationService = ValidationService()
    
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
        if FirebaseAuth.Auth.auth().currentUser != nil {
            router.openChat(animated: false)
        }
    }
    
    func didTapLogIn(email: String, password: String) {
        guard validationService.isValid(email, type: .email),
              validationService.isValid(password, type: .password) else {
            view?.showAlert(message: "Wrong email or password")
            return
        }
        
        view?.shouldActivityIndicatorWorking(true)
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            DispatchQueue.main.async {
                self?.view?.shouldActivityIndicatorWorking(false)
            }
            
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email: \(email)")
                return
            }
            
            let user = result.user
            
            self?.router.openChat(animated: true)
            print("Logged In User: \(user)")
        }
    }
    
    func didTapRegister() {
        router.openSignIn()
    }
}
