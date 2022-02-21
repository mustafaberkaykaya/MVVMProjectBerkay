//
//  AuthTextField.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.02.2022.
//

import UIKit

public class AuthTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)

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
        height(47)
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
      }
      public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
      }
      public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
      }
}
