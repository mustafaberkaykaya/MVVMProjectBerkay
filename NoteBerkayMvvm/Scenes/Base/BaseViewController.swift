//
//  BaseViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController, LoadingProtocol, ActivityIndicatorProtocol {
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    deinit {
        debugPrint("deinit: \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        subscribeViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
        
}

extension BaseViewController {
    private func subscribeViewModel() {
    viewModel.showWarningToast = { text in
            ToastPresenter.showWarningToast(text: text)
    }
        
    viewModel.showSuccessToast = { text in
            ToastPresenter.showSuccessToast(text: text)
    }
    
    viewModel.showActivityIndicatorView = { [weak self] in
            self?.hideActivityIndicator()
    }
        
    viewModel.hideActivityIndicatorView = { [weak self] in
                    self?.hideActivityIndicator()
    }
        
    viewModel.showLoading = { [weak self] in
                    self?.presentLoading()
    }
        
    viewModel.hideLoading = { [weak self] in
                    self?.dismissLoading()
    }
  }
}
