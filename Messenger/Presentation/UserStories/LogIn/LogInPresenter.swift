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
    
    func didTapLogIn(email: String, password: String) {
        view?.shouldActivityIndicatorWorking(true)
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//            guard let strongSelf = self else {
//                return
//            }
            DispatchQueue.main.async {
                self?.view?.shouldActivityIndicatorWorking(false)
            }
            
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email: \(email)")
                return
            }
            
            let user = result.user
            
//            UserDefaults.standard.set(email, forKey: "email")
            
            print("Logged In User: \(user)")
//            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        }
//        router.openChat()
    }
    
    func didTapRegister() {
        router.openSignIn()
    }
}
