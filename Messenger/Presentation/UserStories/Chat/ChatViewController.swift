//
//  ChatViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IChatView: AnyObject {
    
}

final class ChatViewController: UIViewController {
    
    // Dependencies
    private let presenter: IChatPresenter
    
    // Private
    
    // MARK: - Initialization
    
    init(presenter: IChatPresenter) {
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
        view.backgroundColor = .red
    }
    
    private func setUpConstraints() {
        
    }
    
    private func setUpDelegates() {
        
    }
}

// MARK: - IChatView

extension ChatViewController: IChatView {
    
}
