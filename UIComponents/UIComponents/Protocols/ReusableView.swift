//
//  ReusableView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

public protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}
