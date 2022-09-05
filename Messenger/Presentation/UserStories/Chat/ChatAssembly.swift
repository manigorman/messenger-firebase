//
//  ChatAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

final class ChatAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let router = ChatRouter()
        
        let presenter = ChatPresenter(router: router)
        
        let controller = ChatViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
