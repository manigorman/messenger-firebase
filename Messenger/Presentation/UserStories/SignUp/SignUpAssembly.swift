//
//  SignInAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

final class SignUpAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let router = SignUpRouter()
        
        let presenter = SignUpPresenter(router: router)
        
        let controller = SignUpViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
