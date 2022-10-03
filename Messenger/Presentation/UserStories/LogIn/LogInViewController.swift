//
//  LogInViewController.swift
//  Messenger
//
//  Created by Igor Manakov on 04.09.2022.
//

import Foundation
import UIKit
import SnapKit

protocol ILogInView: AnyObject {
    func update()
    func shouldActivityIndicatorWorking(_ flag: Bool)
}

final class LogInViewController: UIViewController {
    
    // Dependencies
    private let presenter: ILogInPresenter
    
    // Private
    private lazy var indicator = UIActivityIndicatorView(style: .large)
    
    // UI
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var imageView = UIImageView()
    private lazy var emailField = UITextField()
    private lazy var passwordField = UITextField()
    private lazy var button = UIButton()
    private lazy var helpButton = UIButton()
    
    // MARK: - Initialization
    
    init(presenter: ILogInPresenter) {
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
    
    @objc private func didTapRegister() {
        presenter.didTapRegister()
    }
    
    @objc private func logInButtonTapped() {
        guard let email = emailField.text,
              let password = passwordField.text,
              !email.isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
            self.alertInfoError()
            return
        }
        
        presenter.didTapLogIn(email: email, password: password)
    }
    
    @objc private func helpButtonTapped() {
        print("help")
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
        title = "LogIn"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        
        imageView.image = UIImage(systemName: "message.fill")
        imageView.contentMode = .scaleToFill
        
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.returnKeyType = .continue
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.returnKeyType = .done
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        
        helpButton.setTitle("Forgot password?", for: .normal)
        helpButton.addTarget(self, action: #selector(helpButtonTapped), for: .touchUpInside)
        helpButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        helpButton.contentHorizontalAlignment = .leading
        helpButton.setTitleColor(.link, for: .normal)
        
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        indicator.backgroundColor = .systemBackground.withAlphaComponent(0.85)
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
        
        contentView.addSubview(emailField)
        emailField.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.addSubview(passwordField)
        passwordField.snp.makeConstraints {
            $0.top.equalTo(emailField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        contentView.addSubview(helpButton)
        helpButton.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        contentView.addSubview(button)
        button.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(helpButton.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUpDelegates() {
        emailField.delegate = self
        passwordField.delegate = self
    }
}

// MARK: - ILogInView

extension LogInViewController: ILogInView {
    func update() {
    }
    
    func shouldActivityIndicatorWorking(_ flag: Bool) {
        if flag {
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailField:
            textField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            logInButtonTapped()
        }
        return true
    }
}
