//
//  SignInPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit
import FirebaseAuth

protocol ISignUpPresenter: AnyObject {
    func viewDidLoad()
    func didTapSignUp(email: String, password: String)
}

final class SignUpPresenter {
    
    // Dependencies
    weak var view: ISignUpView?
    
    private let router: ISignUpRouter
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(router: ISignUpRouter) {
        self.router = router
    }
    
    // MARK: - Private
}

// MARK: - ISignInPresenter

extension SignUpPresenter: ISignUpPresenter {
    
    func viewDidLoad() {
        print("view did load")
    }
    
    func didTapSignUp(email: String, password: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//            guard let strongSelf = self else {
//                return
//            }
            
//            DispatchQueue.main.async {
//                strongSelf.spinner.dismiss()
//            }
            
            guard authResult != nil, error == nil else {
                print("Error creating user")
                return
            }
            
//            let chatUser = ChatAppUser(firstName: firstName,
//                                       lastName: lastName,
//                                       emailAddress: email)
            
//            DatabaseManager.shared.insertUser(with: chatUser, completion: { success in
//                if success {
//                    // upload image
//                    guard let image = strongSelf.imageView.image, let data = image.pngData() else {
//                        return
//                    }
//                    let fileName = chatUser.profilePictureFileName
//                    StorageManager.shared.uploadProfilePicture(with: data, fileName: fileName, completion: { result in
//                        switch result {
//                        case .success(let downloadUrl):
//                            UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
//                            print(downloadUrl)
//                        case .failure(let error):
//                            print("storage manager error: \(error)")
//                        }
//                    })
//
//                }
//            })
            
//            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        }
        
        router.openChat()
    }
}
