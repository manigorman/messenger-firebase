//
//  ChatsAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

final class ChatsAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let router = ChatsRouter()
        
        let presenter = ChatsPresenter(router: router)
        
        let controller = ChatsViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
