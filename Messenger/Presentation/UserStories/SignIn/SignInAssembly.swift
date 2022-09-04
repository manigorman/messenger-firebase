//
//  SignInAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

final class SignInAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let router = SignInRouter()
        
        let presenter = SignInPresenter(router: router)
        
        let controller = SignInViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
