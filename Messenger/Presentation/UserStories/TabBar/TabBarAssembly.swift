//
//  TabBarAssembly.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

final class TabBarAssembly {
    
    // MARK: - Public
    
    func assemble() -> UIViewController {
        let presenter = TabBarPresenter()
        
        let controller = TabBarViewController(presenter: presenter)
        
        let chatsVC = createNavController(with: ChatsAssembly().assemble(),
                                         selected: UIImage(systemName: "message.fill"),
                                         unselected: UIImage(systemName: "message"),
                                         title: "Chat")

        let profileVC = createNavController(with: ProfileAssembly().assemble(),
                                            selected: UIImage(systemName: "person.fill"),
                                            unselected: UIImage(systemName: "person"),
                                            title: "Profile")

        controller.setControllers([chatsVC, profileVC], animated: false)
        
        presenter.view = controller
        
        return controller
    }
    
    func createNavController(with vc: UIViewController, selected: UIImage?, unselected: UIImage?, title: String) -> UINavigationController {
        let viewController = vc
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        navController.title = title
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
}
