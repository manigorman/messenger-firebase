//
//  ProfilePresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 05.09.2022.
//

import Foundation
import UIKit

protocol IProfilePresenter: AnyObject {
    func viewDidLoad()
    func handleLogOut()
}

final class ProfilePresenter {
    
    // Dependencies
    weak var view: IProfileView?
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init() {
    }
    
    // MARK: - Private
}

extension ProfilePresenter: IProfilePresenter {
    func viewDidLoad() {
        print("view did load")
    }
    
    func handleLogOut() {
    }
}
