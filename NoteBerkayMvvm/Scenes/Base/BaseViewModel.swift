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

}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {
    func viewDidLoad()
}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R

    init(router: R) {
        self.router = router
    }
    
    func viewDidLoad() {}
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}
