//
//  ChatRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IChatRouter: AnyObject {
    
}

final class ChatRouter: IChatRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - IChatRouter
}
