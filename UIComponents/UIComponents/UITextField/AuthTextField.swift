//
//  AuthTextField.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.02.2022.
//

import UIKit

public class AuthTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    // swiftlint:disable all
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable all
}
extension AuthTextField {
    private func configureContents() {
        font = .font(.josefinSansRegular, size: 13)
        layer.borderColor = UIColor.appLightGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        
    }
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 17, left: 16, bottom: 17, right: 0))
    }
}
