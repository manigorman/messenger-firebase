//
//  ProfileRouter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IProfileRouter: AnyObject {
    func procedeLogIn()
}

final class ProfileRouter: IProfileRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    
    // MARK: - IProfileRouter
    
    func procedeLogIn() {
        let assembly = LogInAssembly()
        
        let controller = assembly.assemble()
        controller.modalPresentationStyle = .fullScreen
        transitionHandler?.tabBarController?.dismiss(animated: true)
    }
}
