//
//  ProfileAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

final class ProfileAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let router = ProfileRouter()
        
        let presenter = ProfilePresenter(router: router)
        
        let controller = ProfileViewController(presenter: presenter)
        
        presenter.view = controller
        router.transitionHandler = controller
        
        return controller
    }
}
