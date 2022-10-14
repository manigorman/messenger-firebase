//
//  ConversationPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import UIKit

protocol IConversationPresenter: AnyObject {
    func viewDidLoad()
}

final class ConversationPresenter {
    
    // Dependencies
    weak var view: IConversationView?
    
    private let router: IConversationRouter
    private let firebaseDatabaseService: FirebaseDatabaseService
    
    // Private
    
    // MARK: - Initialization
    
    init(router: IConversationRouter,
         firebaseDatabaseService: FirebaseDatabaseService) {
        self.router = router
        self.firebaseDatabaseService = firebaseDatabaseService
    }
        
}

// IConversationPresenter

extension ConversationPresenter: IConversationPresenter {
    func viewDidLoad() {
    }
}
