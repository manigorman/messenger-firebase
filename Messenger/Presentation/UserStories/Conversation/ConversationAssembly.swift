//
//  ConversationAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import UIKit

final class ConversationAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let router = ConversationRouter()
        
        let presenter = ConversationPresenter(router: router)
        
        let controller = ConversationViewContoller(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
    
}
