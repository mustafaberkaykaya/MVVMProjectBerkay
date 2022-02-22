//
//  MainNavigationController.swift
//  NoteSalihMVVM
//
//  Created by Mehmet Salih ÇELİK on 16.02.2022.
//
import UIKit
import MobilliumBuilders
import TinyConstraints

class MainNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        viewController.navigationItem.backButtonTitle = ""
    }

    private func configureContents() {
        let backImage = UIImage.icBackArrow
            .resize(to: .init(width: 20, height: 16))
            .withRenderingMode(.alwaysTemplate)
            .withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0))
        let titleTextAttributes = AttributedStringDictionaryBuilder()
            .font(.font(.josefinSansBold, size: 13))
            .foregroundColor(.appEbonyClay)
            .build()
        navigationBar.barTintColor = .appWhite
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .appEbonyClay
        navigationBar.titleTextAttributes = titleTextAttributes
        UIBarButtonItem.appearance()              .setTitleTextAttributes(AttributedStringDictionaryBuilder()
            .font(.font(.josefinSansSemiBold, size: 14))
            .foregroundColor(.appWhite)
            .build(), for: .normal)
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor = .clear
            appearance.backgroundColor = .appWhite
            appearance.titleTextAttributes = titleTextAttributes
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
        
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: 0), for: .default)
    }

    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
