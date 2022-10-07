//
//  ChatsRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IChatsRouter: AnyObject {
    func openConversation()
}

final class ChatsRouter: IChatsRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - IChatsRouter
    
    func openConversation() {
        let assembly = ConversationAssembly()
        
        let controller = assembly.assemble()
        
        transitionHandler?.navigationController?.pushViewController(controller, animated: true)
    }
}
