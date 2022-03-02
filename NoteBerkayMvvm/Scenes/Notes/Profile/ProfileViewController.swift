//
//  ProfileViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import UIKit
import MobilliumBuilders
import SwiftValidator

final class ProfileViewController: BaseViewController<ProfileViewModel> {
    
    private let mainStackView = UIStackViewBuilder()
        .spacing(15)
        .axis(.vertical)
        .distribution(.fill)
        .build()
    private let nameTextField = AuthTextField()
    private let emailTextField = AuthTextField()
    private let saveButton = CustomButton()
    private let changePasswordLabel = UILabelBuilder()
        .font(.font(.josefinSansSemiBold, size: 14))
        .textColor(.appBlue)
        .textAlignment(.center)
        .build()
    private let signOutLabel = UILabelBuilder()
        .font(.font(.josefinSansSemiBold, size: 14))
        .textColor(.appRed)
        .textAlignment(.center)
        .build()
    private let errorLabel = UILabelBuilder().build()
    private let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        setLocalize()
        getUser()
        subscribeViewModelEvents()
    }
}
// MARK: - UILayout
extension ProfileViewController {
    private func addSubViews() {
        addMainStackView()
        addNameTextField()
        addEmailTextField()
        addSaveButton()
        addChangePasswordLabel()
        addSignOutLabel()
    }
    
    private func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.topToSuperview(usingSafeArea: true).constant = 81
        mainStackView.leadingToSuperview().constant = 25
        mainStackView.trailingToSuperview().constant = -25
    }
    
    private func addNameTextField() {
        mainStackView.addArrangedSubview(nameTextField)
    }
    
    private func addEmailTextField() {
        mainStackView.addArrangedSubview(emailTextField)
    }
    
    private func addSaveButton() {
        mainStackView.addArrangedSubview(saveButton)
        saveButton.height(60)
    }
    
    private func addChangePasswordLabel() {
        mainStackView.addArrangedSubview(changePasswordLabel)
    }
    
    private func addSignOutLabel() {
        mainStackView.addArrangedSubview(signOutLabel)
    }
}

// MARK: - Configure & Set Localize
extension ProfileViewController {
    private func configureContents() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .icBackArrow,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(backButtonTapped))
        let gestureRecognizerChangePassword = UITapGestureRecognizer(target: self, action: #selector(changePasswordLabelTapped))
        let gestureRecognizerSignOut = UITapGestureRecognizer(target: self, action: #selector(changeSignOutLabelTapped))
        
        changePasswordLabel.isUserInteractionEnabled = true
        signOutLabel.isUserInteractionEnabled = true
        changePasswordLabel.addGestureRecognizer(gestureRecognizerChangePassword)
        signOutLabel.addGestureRecognizer(gestureRecognizerSignOut)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        validator.registerField(nameTextField, errorLabel: errorLabel, rules: [RequiredRule(), FullNameRule()])
        validator.registerField(emailTextField, errorLabel: errorLabel, rules: [RequiredRule(), EmailRule()])
    }
    
    private func setLocalize() {
        nameTextField.placeholder = L10n.Profile.name
        emailTextField.placeholder = L10n.Profile.email
        changePasswordLabel.text = L10n.Profile.changePass
        signOutLabel.text = L10n.Profile.signOut
        saveButton.buttonTitle = L10n.Profile.saveButton
        navigationItem.title = L10n.Profile.title
    }
}

// MARK: - Actions
extension ProfileViewController {
    @objc
    private func backButtonTapped() {
        viewModel.showNoteList()
   }

    @objc
    private func changePasswordLabelTapped() {
        viewModel.pushChangePassword()
    }
    
    @objc
    private func changeSignOutLabelTapped() {
        viewModel.pushSignOut()
    }
    
    @objc
    private func saveButtonTapped() {
        validator.validate(self)
    }
}

extension ProfileViewController {
    private func subscribeViewModelEvents() {
        viewModel.didSuccessFetchUser = { [weak self] in
            guard let self = self else { return }
            self.nameTextField.text = self.viewModel.getUser().fullName
            self.emailTextField.text = self.viewModel.getUser().email
        }
    }
    
    private func getUser() {
          self.viewModel.getUserRequest()
    }
}

extension ProfileViewController: ValidationDelegate {
    func validationSuccessful() {
        viewModel.updateUser(userName: nameTextField.text!, email: emailTextField.text!)
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        ToastPresenter.showWarningToast(text: (errors[0].1.errorMessage))
    }
}
