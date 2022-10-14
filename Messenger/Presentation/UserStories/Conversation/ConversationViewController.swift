//
//  ConversationViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import UIKit
import MessageKit

extension MessageKind {
    var messageKindString: String {
        switch self {
        case .text:
            return "text"
        case .attributedText:
            return "attributed_text"
        case .photo:
            return "photo"
        case .video:
            return "video"
        case .location:
            return "locatio"
        case .emoji:
            return "emoji"
        case .audio:
            return "audio"
        case .contact:
            return "contact"
        case .linkPreview:
            return "link_preview"
        case .custom:
            return "custom"
        }
    }
}

protocol IConversationView: AnyObject {
    
}

final class ConversationViewContoller: MessagesViewController {
    
    // Dependencies
    private let presenter: IConversationPresenter
    
    // Private
    private var messages: [Message] = [.init(sender: Sender(photoURL: "",
                                                            senderId: "",
                                                            displayName: "Ivan"),
                                             messageId: "dhsafgshajdkfjhasdfjkhsajkdfhkjasdfhjkadshjf",
                                             sentDate: Date(),
                                             kind: .text("fasdfaf"))]
    
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
        
        presenter.viewDidLoad()
        
        setUpUI()
        setUpConstraints()
        setUpDelegates()
    }
    
    // MARK: - Actions
    
    // MARK: - Private
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setUpConstraints() {
        
    }
    
    private func setUpDelegates() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

// MARK: - IConversationView

extension ConversationViewContoller: IConversationView {
    
}

// MARK: - MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate

extension ConversationViewContoller: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return Sender(photoURL: "", senderId: "12", displayName: "Igor")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.row]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
}
