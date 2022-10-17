//
//  SignInAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import UIKit

final class SignUpAssembly {
    
    // MARK: - Public
    
    func assemble(authCoordinator: AuthCoordinator) -> UIViewController {
        let presenter = SignUpPresenter(coordinator: authCoordinator)
        
        let controller = SignUpViewController(presenter: presenter)
        
        presenter.view = controller
        
        return controller
    }
}
