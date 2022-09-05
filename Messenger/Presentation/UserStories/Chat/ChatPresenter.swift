//
//  ChatPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IChatPresenter: AnyObject {
    func viewDidLoad()
}

final class ChatPresenter {
    
    // Dependencies
    weak var view: IChatView?
    
    private let router: IChatRouter
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(router: IChatRouter) {
        self.router = router
    }
    
    // MARK: - Private
}

extension ChatPresenter: IChatPresenter {
    func viewDidLoad() {
        print("view did load")
    }
}
