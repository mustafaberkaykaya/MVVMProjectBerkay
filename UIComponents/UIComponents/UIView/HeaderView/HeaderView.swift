//
//  HeaderView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 15.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public class HeaderView: UIView {

    private let titleLabel = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: 26))
        .textAlignment(.center)
        .textColor(.appEbonyClay)
        .numberOfLines(0)
        .build()
    private let descriptionLabel = UILabelBuilder()
        .font(.font(.josefinSansRegular, size: 15))
        .textAlignment(.center)
        .textColor(.appDarkGray)
        .numberOfLines(0)
        .build()
    private let stackView = UIStackViewBuilder()
        .alignment(.center)
        .axis(.vertical)
        .spacing(14)
        .build()
    
    public var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    public var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    public var descriptionColor: UIColor? {
        didSet {
            descriptionLabel.textColor = descriptionColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}

extension HeaderView {
    private func addSubViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.edgesToSuperview()
    }
}
 
