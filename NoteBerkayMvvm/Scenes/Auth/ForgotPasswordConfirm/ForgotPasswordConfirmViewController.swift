//
//  ForgotPasswordConfirmViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

final class ForgotPasswordConfirmViewController: BaseViewController<ForgotPasswordConfirmViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    private let contentView = UIViewBuilder().build()
    private let headerView = HeaderView()
    private let loginButton = CustomButton()
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
}

// MARK: - UILayout
extension ForgotPasswordConfirmViewController {
    private func addSubViews() {
        addScrollView()
        addContentView()
        addHeaderView()
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
        headerView.leadingToSuperview().constant = 79
        headerView.trailingToSuperview().constant = -78
        headerView.topToSuperview(usingSafeArea: true).constant = 59
    }
    
    private func addButton() {
        contentView.addSubview(loginButton)
        loginButton.topToBottom(of: headerView).constant = 36
        loginButton.leadingToSuperview().constant = 25
        loginButton.trailingToSuperview().constant = -25
        loginButton.height(60)
        loginButton.bottomToSuperview()
        navigationController?.navigationBar.isHidden = true
    }
}
// MARK: - Configure & SetLocalize
extension ForgotPasswordConfirmViewController {
    private func configureContents() {
        headerView.descriptionColor = .appGreen
        setLocalize()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        headerView.titleText = L10n.Confirm.title
        headerView.descriptionText = "An email has been sent to \(email) with further instructions."
        
        loginButton.buttonTitle = L10n.Confirm.button
    }
}

// MARK: - Actions
extension ForgotPasswordConfirmViewController {
    @objc
    private func loginButtonTapped() {
        viewModel.pushLoginScreen()
    }
}
