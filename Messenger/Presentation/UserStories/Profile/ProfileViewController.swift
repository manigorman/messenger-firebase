//
//  ProfileViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import UIKit
import FirebaseAuth

protocol IProfileView: AnyObject {
    
}

final class ProfileViewController: UIViewController {
    
    // Dependencies
    private let presenter: IProfilePresenter
    
    // Private
    
    // MARK: - Initialization
    
    init(presenter: IProfilePresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        setUpUI()
        setUpConstraints()
        setUpDelegates()
    }
    
    // MARK: - Actions
    
    @objc private func didTapLogOutButton() {
        let actionSheet = UIAlertController(title: "",
                                      message: "Would you like to quit?",
                                      preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log Out",
                                      style: .destructive,
                                      handler: { [weak self] _ in
                                        
                                        do {
                                            try FirebaseAuth.Auth.auth().signOut()
                                            
                                            self?.presenter.handleLogOut()
                                        } catch {
                                            print("Failed to log out.")
                                        }
                                      }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    // MARK: - Private
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
        
        title = "Profile"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapLogOutButton))
        
    }
    
    private func setUpConstraints() {
        
    }
    
    private func setUpDelegates() {
        
    }
}

// MARK: - IProfileView

extension ProfileViewController: IProfileView {
    
}
