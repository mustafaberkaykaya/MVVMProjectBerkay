//
//  LoginViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

final class LoginViewController: BaseViewController<LoginViewModel> {
    private let headerView = HeaderView()
    private let stackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(14)
        .alignment(.fill)
        .distribution(.fill)
        .build()
    private let forgotButton = CustomButton()
    private let textFieldEmail = AuthTextField()
    private let textFieldPassword: AuthTextField = {
        let textField = AuthTextField()
        textField.isSecureTextEntry = true
        return textField
      }()
    private let loginButton = CustomButton()
    private let footer = FooterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    } 
}

// MARK: - UILayout
extension LoginViewController {
    private func addSubViews() {
        addHeader()
        addStackView()
        addForgotButton()
        addLoginButton()
        addFooter()
    }
    
    private func addHeader() {
        view.addSubview(headerView)
        headerView.leadingToSuperview().constant = 42
        headerView.trailingToSuperview().constant = -41
        headerView.topToSuperview(usingSafeArea: true).constant = 59
    }
    
    private func addStackView() {
        view.addSubview(stackView)
        stackView.topToBottom(of: headerView).constant = 39
        stackView.leadingToSuperview().constant = 25
        stackView.trailingToSuperview().constant = -25
        stackView.addArrangedSubview(textFieldEmail)
        stackView.addArrangedSubview(textFieldPassword)
    }
    
    private func addForgotButton() {
        view.addSubview(forgotButton)
        forgotButton.trailingToSuperview().constant = -24
        forgotButton.topToBottom(of: stackView).constant = 13
        forgotButton.backgroundColor = .white
        forgotButton.titleLabel?.font = .font(.josefinSansRegular, size: 13)
        forgotButton.titleColor = .appEbonyClay
        forgotButton.height(13)
        
    }
    
    private func addLoginButton() {
        view.addSubview(loginButton)
        loginButton.height(60)
        loginButton.leadingToSuperview().constant = 25
        loginButton.trailingToSuperview().constant = -25
        loginButton.topToBottom(of: forgotButton).constant = 27
        loginButton.tintColor = .appBlue
    }
    
    private func addFooter() {
        view.addSubview(footer)
        footer.leadingToSuperview().constant = 5
        footer.trailingToSuperview().constant = -5
        footer.bottomToSuperview(usingSafeArea: true).constant = -34
        footer.height(15)
    }
}

// MARK: - Configure & SetLocalize
extension LoginViewController {
    private func configureContents() {
        configureSignUp()
        setLocalize()
        
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        forgotButton.addTarget(self, action: #selector(tappedforgotPassword), for: .touchUpInside)
    }
    
    private func setLocalize() {
        textFieldEmail.placeholder = L10n.Login.placeholderMail
        textFieldPassword.placeholder = L10n.Login.placeholderPass
       
        forgotButton.buttonTitle = L10n.Login.forgot
        loginButton.buttonTitle = L10n.Login.title
       
        footer.leftLabelText = L10n.Login.footerLeft
        footer.rightButtonTitle = L10n.Login.footerRight
            
        headerView.titleText = L10n.Login.title
        headerView.descriptionText = L10n.Login.description
    }
    
    private func configureSignUp() {
        footer.actionClousure = { [weak self] in
            self?.viewModel.pushRegisterScene()
        }
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    private func tappedLoginButton() {
        if let email = textFieldEmail.text, email.isEmpty,
           let password = textFieldPassword.text, password.isEmpty {
            return ToastPresenter.showWarningToast(text: L10n.Login.emailandpasswordError)
        }
        
        guard let email = textFieldEmail.text, !email.isEmpty else {
            return ToastPresenter.showWarningToast(text: L10n.Login.emailError)
        }
        guard let password = textFieldPassword.text, !password.isEmpty else {
            return ToastPresenter.showWarningToast(text: L10n.Login.passwordError)
        }
        
        let validation = Validation()
        guard validation.isValidPassword(password) else { return }
        guard validation.isValidEmail(email) else { return }
        viewModel.sendLoginRequest(email: textFieldEmail.text!, password: textFieldPassword.text!)
    }
    
    @objc
    private func tappedforgotPassword() {
        viewModel.pushPasswordResetScene()
    }
    
    @objc
    private func tappedSignUpButton() {
        viewModel.pushRegisterScene()
    }
}
