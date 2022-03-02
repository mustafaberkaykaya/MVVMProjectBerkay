//
//  ChangePasswordViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import UIKit
import MobilliumBuilders
import SwiftValidator

final class ChangePasswordViewController: BaseViewController<ChangePasswordViewModel> {
    
    private let mainStackView = UIStackViewBuilder()
        .spacing(15)
        .axis(.vertical)
        .distribution(.fill)
        .build()
    private let passwordTextField: AuthTextField = {
           let textField = AuthTextField()
           textField.isSecureTextEntry = true
           return textField
    }()
    private let newPasswordTextField: AuthTextField = {
           let textField = AuthTextField()
           textField.isSecureTextEntry = true
           return textField
    }()
    private let newRePasswordTextField: AuthTextField = {
           let textField = AuthTextField()
           textField.isSecureTextEntry = true
           return textField
    }()
    private let saveButton = CustomButton()
    private let errorLabel = UILabelBuilder().build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
    }
}
// MARK: - UILayout
extension ChangePasswordViewController {
    private func addSubViews() {
        addMainStackView()
        addPasswordsField()
        addSaveButton()
    }
    
    private func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.topToSuperview(usingSafeArea: true).constant = 81
        mainStackView.leadingToSuperview().constant = 25
        mainStackView.trailingToSuperview().constant = -25
    }
    
    private func addPasswordsField() {
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(newPasswordTextField)
        mainStackView.addArrangedSubview(newRePasswordTextField)
    }
    
    private func addSaveButton() {
        mainStackView.addArrangedSubview(saveButton)
        saveButton.height(60)
        mainStackView.setCustomSpacing(33, after: newRePasswordTextField)
    }
}

// MARK: - Configure & Set Localize
extension ChangePasswordViewController {
    private func configureContents() {
        saveButton.addTarget(self, action: (#selector(saveButtonTapped)), for: .touchUpInside)
    }
    
    private func setLocalize() {
        passwordTextField.placeholder = L10n.ChangePassword.password
        newPasswordTextField.placeholder = L10n.ChangePassword.newPassword
        newRePasswordTextField.placeholder = L10n.ChangePassword.newrePassword
        saveButton.buttonTitle = L10n.ChangePassword.saveButton
        navigationItem.title = L10n.ChangePassword.title
    }
}

// MARK: - Actions
extension ChangePasswordViewController {
    @objc
    private func saveButtonTapped() {
        let validator = Validator()
        validator.registerField(newPasswordTextField, errorLabel: errorLabel, rules: [RequiredRule(), PasswordRule()])
        validator.validate(self)
    }
}

extension ChangePasswordViewController: ValidationDelegate {
    func validationSuccessful() {
        if newPasswordTextField.text == newRePasswordTextField.text {
            viewModel.changePassword(password: passwordTextField.text!,
                                     newPassword: newPasswordTextField.text!,
                                     retypeNewPassword: newRePasswordTextField.text!)
        } else {
            ToastPresenter.showWarningToast(text: L10n.ChangePassword.matchPassword)
        }
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        ToastPresenter.showWarningToast(text: (errors[0].1.errorMessage))
    }
}
