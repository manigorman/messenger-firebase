//
//  ConversationRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import UIKit

protocol IConversationRouter: AnyObject {
}

final class ConversationRouter: IConversationRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - IConversationRouter
    
}
