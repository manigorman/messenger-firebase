//
//  ProfileViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

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
    
    // MARK: - Private
    
    private func setUpUI() {
        view.backgroundColor = .blue
    }
    
    private func setUpConstraints() {
        
    }
    
    private func setUpDelegates() {
        
    }
}

// MARK: - IProfileView

extension ProfileViewController: IProfileView {
    
}
