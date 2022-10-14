//
//  Sender.swift
//  Messenger
//
//  Created by Igor Manakov on 13.10.2022.
//

import Foundation
import MessageKit

struct Sender: SenderType {
    public var photoURL: String
    public var senderId: String
    public var displayName: String
}
