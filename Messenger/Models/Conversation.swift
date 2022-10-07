//
//  Conversation.swift
//  Messenger
//
//  Created by Igor Manakov on 05.10.2022.
//

import Foundation
import MessageKit

struct Conversation {
    let id: String
    let name: String
    let otherUserEmail: String
    let latestMessage: LatestMessage
}

struct LatestMessage {
    let date: String
    let text: String
    let isRead: Bool
}
