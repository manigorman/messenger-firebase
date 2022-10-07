//
//  ConversationViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import Foundation
import UIKit

protocol IConversationView: AnyObject {
    
}

final class ConversationViewContoller: UIViewController {
    
    // Dependencies
    private let presenter: IConversationPresenter
    
    // Private
    
    // UI
    
    // MARK: - Initialization
    
    init(presenter: IConversationPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpConstraints()
    }
    
    // MARK: - Actions
    
    // MARK: - Private
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpConstraints() {
        
    }
}

// MARK: - IConversationView

extension ConversationViewContoller: IConversationView {
    
}
