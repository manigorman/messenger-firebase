//
//  SignUpViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit

protocol ISignUpView: AnyObject {
    func update()
    
}

final class SignUpViewController: UIViewController {
    
    // Dependencies
    private let presenter: ISignUpPresenter
    
    // Private
    private lazy var indicator = UIActivityIndicatorView(style: .large)
    
    private var activeField: UITextField?
    private var lastOffset = CGPoint()
    
    // UI
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var imageView = UIImageView()
    private lazy var firstNameField = UITextField()
    private lazy var lastNameField = UITextField()
    private lazy var emailField = UITextField()
    private lazy var passwordField = UITextField()
    private lazy var button = UIButton()
    
    // MARK: - Initialization
    
    init(presenter: ISignUpPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc private func signUpButtonTapped() {
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
            self.alertInfoError()
            return
        }
        
        presenter.didTapSignUp(email: email, password: password)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            return
        }

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)

        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
        for recognizer in view.gestureRecognizers ?? [] {
            view.removeGestureRecognizer(recognizer)
        }
    }
    
    // MARK: - Private
    
    private func setUpUI() {
        view.backgroundColor = .systemBackground
        title = "SignIn"
        
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleToFill
        
        firstNameField.autocorrectionType = .no
        firstNameField.autocapitalizationType = .none
        firstNameField.placeholder = "First Name"
        firstNameField.borderStyle = .roundedRect
        firstNameField.returnKeyType = .continue
        
        lastNameField.autocorrectionType = .no
        lastNameField.autocapitalizationType = .none
        lastNameField.placeholder = "Last Name"
        lastNameField.borderStyle = .roundedRect
        lastNameField.returnKeyType = .continue
        
        emailField.autocorrectionType = .no
        emailField.autocapitalizationType = .none
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.returnKeyType = .continue
        
        passwordField.autocorrectionType = .no
        passwordField.autocapitalizationType = .none
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.returnKeyType = .done
        passwordField.isSecureTextEntry = true
        
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setUpConstraints() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.top.bottom.equalToSuperview()
        }
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        contentView.addSubview(firstNameField)
        firstNameField.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.addSubview(lastNameField)
        lastNameField.snp.makeConstraints {
            $0.top.equalTo(firstNameField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.addSubview(emailField)
        emailField.snp.makeConstraints {
            $0.top.equalTo(lastNameField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.addSubview(passwordField)
        passwordField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(passwordField.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setUpDelegates() {
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }
}

// MARK: - ISignInView

extension SignUpViewController: ISignUpView {
    
    func update() {
        
    }
}

// MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        lastOffset = self.scrollView.contentOffset
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeField?.resignFirstResponder()
        activeField = nil
        
//        switch textField {
//        case firstNameField:
//            textField.resignFirstResponder()
//            lastNameField.becomeFirstResponder()
//        case lastNameField:
//            textField.resignFirstResponder()
//            emailField.becomeFirstResponder()
//        case emailField:
//            textField.resignFirstResponder()
//            passwordField.becomeFirstResponder()
//        default:
//            signUpButtonTapped()
//            textField.resignFirstResponder()
//        }
        return true
    }
    
}