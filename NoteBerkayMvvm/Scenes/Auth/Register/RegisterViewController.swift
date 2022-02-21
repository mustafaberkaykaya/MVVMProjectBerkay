//
//  RegisterViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 18.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let headerView = HeaderView()
    private let textFieldStackView = UIStackViewBuilder()
        .axis(.vertical)
        .distribution(.fillEqually)
        .spacing(14)
        .build()
    private let emailTextField = AuthTextField()
    private let fullNameTextField = AuthTextField()
    private let passwordTextField: AuthTextField = {
           let textField = AuthTextField()
           textField.isSecureTextEntry = true
           return textField
    }()
    private let forgotButton = CustomButton()
    private let signUpButton = CustomButton()
    private let footer = FooterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - UILayout
extension RegisterViewController {
    private func addSubViews() {
        addScrollView()
        addContentView()
        addHeaderView()
        addTextFieldStackView()
        addForgotButton()
        addSignUpButton()
        addFooterView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addContentView() {
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
    }
    
    private func addHeaderView() {
        contentView.addSubview(headerView)
        headerView.leadingToSuperview().constant = 42
        headerView.trailingToSuperview().constant = -41
        headerView.topToSuperview(usingSafeArea: true).constant = 59
    }
    
    private func addTextFieldStackView() {
        contentView.addSubview(textFieldStackView)
        textFieldStackView.topToBottom(of: headerView).constant = 39
        textFieldStackView.leadingToSuperview().constant = 25
        textFieldStackView.trailingToSuperview().constant = -25
        
        textFieldStackView.addArrangedSubview(fullNameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
    }
    
    private func addForgotButton() {
        contentView.addSubview(forgotButton)
        forgotButton.trailingToSuperview().constant = -24
        forgotButton.topToBottom(of: textFieldStackView).constant = 13
        forgotButton.backgroundColor = .white
        forgotButton.titleLabel?.font = .font(.josefinSansRegular, size: 13)
        forgotButton.titleColor = .appEbonyClay
        forgotButton.height(13)
    }
    
    private func  addSignUpButton() {
        contentView.addSubview(signUpButton)
        signUpButton.leadingToSuperview().constant = 25
        signUpButton.trailingToSuperview().constant = -25
        signUpButton.topToBottom(of: forgotButton).constant = 27
        signUpButton.bottomToSuperview().constant = -8
        signUpButton.tintColor = .appBlue
        signUpButton.height(60)
    }
    
    private func  addFooterView() {
        view.addSubview(footer)
        footer.leadingToSuperview().constant = 5
        footer.trailingToSuperview().constant = -5
        footer.bottomToSuperview(usingSafeArea: true).constant = -34
        footer.topToBottom(of: scrollView).constant = 5
        footer.height(15)
    }
}
// MARK: - Configure & SetLocalize
extension RegisterViewController {
    private func configureContents() {
        setLocalize()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        forgotButton.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        footer.actionClousure = {
            self.viewModel.pushLoginScene()
        }
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.Register.title
        headerView.descriptionText = L10n.Register.description
        
        emailTextField.placeholder = L10n.Register.email
        fullNameTextField.placeholder = L10n.Register.fullName
        passwordTextField.placeholder = L10n.Register.password
        
        forgotButton.buttonTitle = L10n.Register.forgot
        signUpButton.buttonTitle = L10n.Register.title
        
        footer.leftLabelText = L10n.Register.already
        footer.rightButtonTitle = L10n.Register.signIn
    }
}

// MARK: - Actions
extension RegisterViewController {
    @objc
    private func signUpButtonTapped() {
        viewModel.sendRegisterRequest(username: fullNameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    @objc
    private func forgotPasswordTapped() {
        viewModel.pushPasswordResetScene()
    }
    
    @objc
    private func signInButtonTapped() {
        viewModel.pushLoginScene()
    }
}
