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
    
    func assemble() -> UIViewController {
        let router = LogInRouter()
        
        let presenter = LogInPresenter(router: router)
        
        let controller = LogInViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
