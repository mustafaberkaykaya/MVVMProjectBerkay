//
//  LoginViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import UIKit
import TinyConstraints

final class LoginViewController: BaseViewController<LoginViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let headerView = HeaderView()
//        headerView.descriptionText = "Login or sign up to continue using our app."
//        headerView.titleText = "Login"
//        view.addSubview(headerView)
//        headerView.leadingToSuperview().constant = 42
//        headerView.trailingToSuperview().constant = -41
//        headerView.topToSuperview().constant = 103
        
//        let textField = AuthTextField()
//        textField.placeholder = "Deneme"
//        view.addSubview(textField)
//        textField.centerYToSuperview()
//        textField.leadingToSuperview().constant = 25
//        textField.trailingToSuperview().constant = -25
        
//        let button = CustomButton()
//        view.addSubview(button)
//        button.buttonTitle = "Login"
//        button.height(60)
//        button.leadingToSuperview().constant = 25
//        button.trailingToSuperview().constant = -25
//        button.centerYToSuperview()
        
        let footer = FooterView()
        footer.leftLabelText = "New User?"
        footer.rightButtonTitle = " Sign up now"
        view.addSubview(footer)
        footer.bottomToSuperview(usingSafeArea:true).constant = -34
        footer.leadingToSuperview().constant = 109
        footer.trailingToSuperview().constant = -108
        footer.isUserInteractionEnabled = true
        
        

    } 
}
