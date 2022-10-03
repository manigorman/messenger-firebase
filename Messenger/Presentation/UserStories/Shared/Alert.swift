//
//  Alert.swift
//  Messenger
//
//  Created by Igor Manakov on 06.09.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alertInfoError(message: String = "Please make sure that all fields are filled") {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true)
    }
}
