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
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
   
    let dataProvider: DataProviderProtocol
    
    var showSuccessToast: StringClosure?
    var showWarningToast: StringClosure?
    
    let router: R

    init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
        self.router = router
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {}
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}
