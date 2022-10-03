//
//  SignInRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

protocol ISignUpRouter: AnyObject {
    func openChat()
}

final class SignUpRouter: ISignUpRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - ISignInRouter
    
    func openChat() {
        let assembly = TabBarAssembly()
        let controller = assembly.assemble()
        controller.modalPresentationStyle = .fullScreen
        
        transitionHandler?.present(controller, animated: true)
    }
}