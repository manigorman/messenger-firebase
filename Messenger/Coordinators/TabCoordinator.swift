//
//  TabCoordinator.swift
//  Messenger
//
//  Created by Igor Manakov on 14.10.2022.
//

import UIKit

protocol ITabCoordinator: AnyObject {
    
}

final class TabCoordinator: Coordinator {
    var parentCoordinator: IAppCoordinator
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Initialization
    init(parentCoordinator: AppCoordinator,
         navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
        
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Coordinator
    
    func start() {
        showFirstScene()
    }
    
    func showFirstScene() {
        let assembly = TabBarAssembly()
        let controller = assembly.assemble()
        navigationController.viewControllers = [controller]
    }
}
