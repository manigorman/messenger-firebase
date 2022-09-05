//
//  TabBarRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol ITabBarRouter: AnyObject {
    
}

final class TabBarRouter: ITabBarRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - ITabBarRouter
}
