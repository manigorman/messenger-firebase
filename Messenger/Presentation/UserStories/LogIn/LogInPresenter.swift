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
    func didTapSignUp()
}

final class LogInPresenter {
    
    // Dependencies
    weak var view: ILogInView?
    
    private let coordinator: IAuthCoordinator
    
    private let validationService = ValidationService()
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(coordinator: IAuthCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Private
}

// MARK: - ILogInPresenter

extension LogInPresenter: ILogInPresenter {
    
    func viewDidLoad() {
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
            
            self?.coordinator.showTab()
            print("Logged In User: \(user)")
        }
    }
    
    func didTapSignUp() {
        coordinator.didTapSignUp()
    }
}
