//
//  ActivityIndicatorView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 16.02.2022.
//

import UIKit

public class ActivityIndicatorView: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        style = .gray
        tintColor = .appSilver
        hidesWhenStopped = true
    }
}
