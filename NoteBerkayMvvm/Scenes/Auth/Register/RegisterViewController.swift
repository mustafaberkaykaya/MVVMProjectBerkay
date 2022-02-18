//
//  RegisterViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 18.02.2022.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

final class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let scrollView = UIScrollViewBuilder().build()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
}
// MARK: - UILayout
extension RegisterViewController {
    private func addSubViews() {
        addScrollView()
    }
    private func addScrollView() {
        
    }
}
