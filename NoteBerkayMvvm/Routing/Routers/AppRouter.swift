//
//  AppRouter.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = LoginRoute
    
    static let shared = AppRouter()
    
    weak var window: UIWindow?
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    func startApp() {
           AppRouter.shared.placeOnWindowLogin()
       }
}
