//
//  Animator.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
  var isPresenting: Bool { get set }
}
