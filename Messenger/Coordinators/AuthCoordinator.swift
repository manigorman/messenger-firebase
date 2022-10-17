//
//  AuthCoordinator.swift
//  Messenger
//
//  Created by Igor Manakov on 14.10.2022.
//

import UIKit

protocol IAuthCoordinator: AnyObject {
    func didTapSignUp()
    func showTab()
}

class AuthCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var parentCoordinator: IAppCoordinator
    
    // MARK: - Initialization
    
    init(parentCoordinator: AppCoordinator,
         navigationController: UINavigationController) {
        self.parentCoordinator = parentCoordinator
        self.navigationController = navigationController
        
        navigationController.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Coordinator
    
    func start() {
        showFirstScene()
    }
    
    func showFirstScene() {
        let assembly = LogInAssembly()
        let controller = assembly.assemble(authCoordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func showSecondScene() {
        let assembly = SignUpAssembly()
        let controller = assembly.assemble(authCoordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - IAuthCoordinator

extension AuthCoordinator: IAuthCoordinator {
    func didTapSignUp() {
        showSecondScene()
    }
    
    func showTab() {
        parentCoordinator.logIn()
    }
}
