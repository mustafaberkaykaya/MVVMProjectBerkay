//
//  CustomButton.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.02.2022.
//

import UIKit

public class CustomButton: UIButton {

    public var buttonTitle: String? {
        didSet {
            setTitle(buttonTitle, for: .normal)
        }
    }
    
    public var titleColor: UIColor? {
        didSet {
            setTitleColor(titleColor, for: .normal)
        }
    }
    
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
extension CustomButton {
    private func configureContents() {
        backgroundColor = .appBlue
        titleLabel?.font = .font(.josefinSansSemiBold, size: 15)
        layer.cornerRadius = 5
    }
}
