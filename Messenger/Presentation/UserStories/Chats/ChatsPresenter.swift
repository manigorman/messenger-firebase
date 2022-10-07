//
//  ChatsPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IChatsPresenter: AnyObject {
    func viewDidLoad()
    func didTapNewConversation()
    func didTapCell(at indexPath: IndexPath)
}

final class ChatsPresenter {
    
    // Dependencies
    weak var view: IChatsView?
    
    private let router: IChatsRouter
    
    // Private
    
    // Models
    // MARK: - Initialization
    
    init(router: IChatsRouter) {
        self.router = router
    }
    
    // MARK: - Private
}

// MARK: - IChatsPresenter

extension ChatsPresenter: IChatsPresenter {
    func viewDidLoad() {
        print("view did load")
    }
    
    func didTapNewConversation() {
        print("new conversation")
    }
    
    func didTapCell(at indexPath: IndexPath) {
        router.openConversation()
    }
}
