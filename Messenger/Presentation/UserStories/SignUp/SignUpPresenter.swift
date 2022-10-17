//
//  SignInPresenter.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import UIKit
import FirebaseAuth

protocol ISignUpPresenter: AnyObject {
    func viewDidLoad()
    func didTapSignUp(email: String, password: String, firstName: String, lastName: String, image: UIImage?)
}

final class SignUpPresenter {
    
    // Dependencies
    weak var view: ISignUpView?
    private let coordinator: IAuthCoordinator?
    
    private let validationService = ValidationService()
    private let databaseService = FirebaseDatabaseService()
    private let storageService = FirebaseStorageService()
    
    // Private
    
    // Models
    
    // MARK: - Initialization
    
    init(coordinator: IAuthCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Private
}

// MARK: - ISignInPresenter

extension SignUpPresenter: ISignUpPresenter {
    
    func viewDidLoad() {
    }
    
    func didTapSignUp(email: String, password: String, firstName: String, lastName: String, image: UIImage?) {
        guard validationService.isValid(email, type: .email),
              validationService.isValid(password, type: .password),
              validationService.isValid(firstName, type: .onlyLetters),
              validationService.isValid(lastName, type: .onlyLetters) else {
            view?.showAlert(message: "Wrong email or password")
            return
        }
        
        view?.shouldActivityIndicatorWorking(true)
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            guard authResult != nil, error == nil else {
                print("Error creating user")
                return
            }
            
            let user = User(firstName: firstName, lastName: lastName, emailAddress: email)
            
            self.databaseService.insertUser(with: user) { flag in
                if flag {
                    // upload image
                    guard let image = image, let data = image.pngData() else {
                        return
                    }
                    let fileName = user.profilePictureFileName
                    self.storageService.uploadProfilePicture(with: data, fileName: fileName, completion: { result in
                        switch result {
                        case .success(let downloadUrl):
                            UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
                            self.view?.shouldActivityIndicatorWorking(false)
//                            self.router.openChat()
                            print(downloadUrl)
                        case .failure(let error):
                            print("storage manager error: \(error)")
                        }
                    })
                }
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
    }
}
