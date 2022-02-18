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
    private let textFieldEmail = AuthTextField()
    private let textFieldPassword: AuthTextField = {
        let textField = AuthTextField()
        textField.isSecureTextEntry = true
        return textField
      }()
    private let forgotLabel = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: 13))
        .textColor(.appEbonyClay)
        .build()
    private let button = CustomButton()
    private let footer = FooterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    } 
}

// MARK: - UILayout
extension LoginViewController {
    private func addSubViews() {
        addHeader()
        addStackView()
        addLabel()
        addButton()
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
    
    private func addLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.trailingToSuperview().constant = -24
        forgotLabel.topToBottom(of: stackView).constant = 13
    }
    
    private func addButton() {
        view.addSubview(button)
        button.height(60)
        button.leadingToSuperview().constant = 25
        button.trailingToSuperview().constant = -25
        button.topToBottom(of: forgotLabel).constant = 27
        button.tintColor = .appBlue
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
    }
    
    private func setLocalize() {
        textFieldEmail.placeholder = L10n.Login.placeholderMail
        textFieldPassword.placeholder = L10n.Login.placeholderPass
       
        forgotLabel.text = L10n.Login.forgot
        button.buttonTitle = L10n.Login.title
       
        footer.leftLabelText = L10n.Login.footerLeft
        footer.rightButtonTitle = L10n.Login.footerRight
        textFieldPassword.isSecureTextEntry = true
        
        headerView.titleText = L10n.Login.title
        headerView.descriptionText = L10n.Login.description
    }
    
    private func configureSignUp() {
        footer.actionClousure = {
            print("fddf")
        }
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    private func tappedLoginButton() {
        viewModel.pushNotesScene()
    }
    
    @objc
    private func tappedforgotPassword() {
        viewModel.pushPasswordResetScene()
    }
}
