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
        
        let presenter = ProfilePresenter()
        
        let controller = ProfileViewController(presenter: presenter)
        
        presenter.view = controller
        
        return controller
    }
}
