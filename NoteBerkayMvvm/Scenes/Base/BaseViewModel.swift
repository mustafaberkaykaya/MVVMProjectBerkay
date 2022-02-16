//
//  BaseViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {
    
}

protocol BaseViewModelEventSource: AnyObject {
    var showWarningToast: StringClosure? { get set }
    var showSuccessToast: StringClosure? { get set }
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    let router: R
    let dataProvider: DataProviderProtocol
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showSuccessToast: StringClosure?
    var showWarningToast: StringClosure?
    
    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {}
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}
