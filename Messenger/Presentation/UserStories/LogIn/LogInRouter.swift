//
//  LogInRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

protocol ILogInRouter: AnyObject {
    func openSignIn()
    func openChat(animated: Bool)
}

final class LogInRouter: ILogInRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - ILogInRouter
    
    func openChat(animated: Bool) {
        let assembly = TabBarAssembly()
        let controller = assembly.assemble()
        controller.modalPresentationStyle = .fullScreen
        
        transitionHandler?.present(controller, animated: animated)
    }

    func openSignIn() {
        let assembly = SignUpAssembly()
        let controller = assembly.assemble()
        
        transitionHandler?.navigationController?.pushViewController(controller, animated: true)
    }
}
