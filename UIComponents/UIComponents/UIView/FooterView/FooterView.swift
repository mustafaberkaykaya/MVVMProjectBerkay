//
//  FooterView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

public class FooterView: UIView {
    private let leftLabel = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: 15))
        .textAlignment(.center)
        .build()
    private let rightButton = UIButtonBuilder()
        .titleFont(.font(.josefinSansRegular, size: 15))
        .build()
    private let stackView = UIStackViewBuilder()
        .axis(.horizontal)
        .alignment(.center)
        .build()
    
    public var leftLabelText: String? {
        didSet {
            leftLabel.text = leftLabelText
        }
    }
    public var rightButtonTitle: String? {
        didSet {
            rightButton.setTitle(rightButtonTitle, for: .normal)
        }
    }
    
    public var actionClousure:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        addSubviews()
    }
    // swiftlint:disable all
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable all
}

// MARK: - UILayout
extension FooterView {
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightButton)
        stackView.centerXToSuperview()
        stackView.leadingToSuperview(relation: .equalOrGreater)
        stackView.trailingToSuperview(relation: .equalOrLess)
    }
}

// MARK: - Configure
extension FooterView {
    private func configureContents() {
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
extension FooterView {
    @objc
    private func rightButtonTapped(_ sender: UITapGestureRecognizer) {
        actionClousure?()
        print("fff")
    }
}
 
