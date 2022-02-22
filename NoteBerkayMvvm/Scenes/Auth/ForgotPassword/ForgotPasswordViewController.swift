//
//  ForgotPasswordViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

final class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let headerView = HeaderView()
    private let emailText = AuthTextField()
    private let resetPasswordButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
}

// MARK: - UILayout
extension ForgotPasswordViewController {
    private func addSubViews() {
        addScrollView()
        addContentView()
        addHeaderView()
        addEmail()
        addButton()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()
    }
    
    private func addContentView() {
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
    }
    
    private func addHeaderView() {
        contentView.addSubview(headerView)
        headerView.leadingToSuperview().constant = 76
        headerView.trailingToSuperview().constant = -75
        headerView.topToSuperview(usingSafeArea: true).constant = 59
    }
    
    private func addEmail() {
        contentView.addSubview(emailText)
        emailText.topToBottom(of: headerView).constant = 31
        emailText.leadingToSuperview().constant = 25
        emailText.trailingToSuperview().constant = -25
    }
    
    private func addButton() {
        contentView.addSubview(resetPasswordButton)
        resetPasswordButton.topToBottom(of: emailText).constant = 35
        resetPasswordButton.leadingToSuperview().constant = 25
        resetPasswordButton.trailingToSuperview().constant = -25
        resetPasswordButton.height(60)
        resetPasswordButton.bottomToSuperview()
    
    }
}

// MARK: - Configure & SetLocalize
extension ForgotPasswordViewController {
    private func configureContents() {
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .touchUpInside)
        
        setLocalize()
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.Forgot.title
        headerView.descriptionText = L10n.Forgot.description
        emailText.placeholder = L10n.Forgot.email
        resetPasswordButton.buttonTitle = L10n.Forgot.button
    }
}

// MARK: - Actions
extension ForgotPasswordViewController {
    @objc
    private func resetPasswordButtonTapped() {
        viewModel.sendForgotPassRequest(email: emailText.text!)
    }
}
