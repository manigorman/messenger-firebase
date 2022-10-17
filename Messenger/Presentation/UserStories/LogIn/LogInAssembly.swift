//
//  LogInAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

final class LogInAssembly {
    
    // MARK: - Public
    
    func assemble(authCoordinator: AuthCoordinator) -> UIViewController {
        
        let presenter = LogInPresenter(coordinator: authCoordinator)
        
        let controller = LogInViewController(presenter: presenter)
        
        presenter.view = controller
        
        return controller
    }
}
