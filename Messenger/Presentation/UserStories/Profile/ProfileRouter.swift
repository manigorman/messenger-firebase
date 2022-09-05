//
//  ProfileRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IProfileRouter: AnyObject {
    
}

final class ProfileRouter: IProfileRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - IProfileRouter
}
