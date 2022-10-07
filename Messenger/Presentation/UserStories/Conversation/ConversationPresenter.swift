//
//  ConversationPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import UIKit

protocol IConversationPresenter: AnyObject {
    
}

final class ConversationPresenter {
    
    // Dependencies
    weak var view: IConversationView?
    
    private let router: IConversationRouter
    
    // Private
    
    // MARK: - Initialization
    
    init(router: IConversationRouter) {
        self.router = router
    }
        
}

// IConversationPresenter

extension ConversationPresenter: IConversationPresenter {
    
}
