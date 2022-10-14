//
//  ChatsViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit
import SnapKit

protocol IChatsView: AnyObject {
    func update(with model: ChatsViewController.Model)
    func shouldActivityIndicatorWorking(_ flag: Bool)
}

final class ChatsViewController: UIViewController {
    
    struct Model {
        let conversations: [Conversation]
    }
    
    // Dependencies
    private let presenter: IChatsPresenter
    
    // Private
    private var conversations: [Conversation] = []
    
    // UI
    private lazy var searchController = UISearchController()
    private lazy var table = UITableView(frame: .zero, style: .plain)
    private lazy var warningLabel = UILabel()
    
    private lazy var indicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Initialization
    
    init(presenter: IChatsPresenter) {
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
    
    @objc private func didTapComposeButton() {
        presenter.didTapNewConversation()
    }
    
    // MARK: - Private
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
        
        title = "Chats"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self,
                                                            action: #selector(didTapComposeButton))
        
        navigationItem.searchController = searchController
        
        table.register(ConversationCell.self, forCellReuseIdentifier: ConversationCell.identifier)
        
        warningLabel.text = "Нет сообщений"
        warningLabel.textAlignment = .center
        warningLabel.textColor = .gray
        warningLabel.font = .systemFont(ofSize: 21, weight: .medium)
        warningLabel.isHidden = true
    }
    
    private func setUpConstraints() {
        view.addSubview(table)
        table.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(warningLabel)
        warningLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setUpDelegates() {
        searchController.searchResultsUpdater = self
        
        table.delegate = self
        table.dataSource = self
    }
}

// MARK: - IChatView

extension ChatsViewController: IChatsView {
    func update(with model: Model) {
        self.conversations = model.conversations
    }
    
    func shouldActivityIndicatorWorking(_ flag: Bool) {
        if flag {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }
}

// MARK: - UISearchResultsUpdating

extension ChatsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        print(text)
    }
}

// MARK: - UITableViewDelegate

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
}

// MARK: - UITableViewDataSource

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: ConversationCell.identifier) as? ConversationCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: .init(image: UIImage(systemName: "person.fill")!,
                                   title: "Igor Manakov",
                                   subtitle: "Hey! What's up. Haven't seen for a long time. So, let hang out todays evening.",
                                   date: Date()))
        
        return cell
    }
}
