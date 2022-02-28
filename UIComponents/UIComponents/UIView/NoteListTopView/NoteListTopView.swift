//
//  NoteListTopView.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 28.02.2022.
//

import UIKit
import MobilliumBuilders

public class NoteListTopView: UIView {
    
    private let hamburgerIconButton = UIButtonBuilder()
        .backgroundColor(.white)
        .tintColor(.appEbonyClay)
        .image(.icHamburger)
        .build()
    private let searchTextField = UITextFieldBuilder()
        .cornerRadius(4)
        .borderColor(UIColor.appLightGray.cgColor)
        .font(.font(.josefinSansRegular, size: 13))
        .build()
    private let profileButton = UIButtonBuilder()
        .masksToBounds(true)
        .clipsToBounds(true)
        .cornerRadius(16)
        .borderWidth(2)
        .borderColor(UIColor.appBlue.cgColor)
        .imageEdgeInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        .build()
    private let cancelButton = UIButtonBuilder()
        .tintColor(.appBlue)
        .titleFont(.font(.josefinSansSemiBold, size: 12))
        .build()
    private let profilImageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .masksToBounds(true)
        .clipsToBounds(true)
        .backgroundColor(.red)
        .cornerRadius(15)
        .borderWidth(2)
        .build()
    
    public var profileButtonTapped: VoidClosure?
    public var cancelButtonTapped: VoidClosure?
    public var hamburgerButtonTapped: VoidClosure?
    public var searchTextFieldTapped: StringClosure?
    
    weak var viewModel: NoteListTopViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
        setLocalize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
        setLocalize()
  
    }
    
    public func set(viewModel: NoteListTopViewProtocol) {
        self.viewModel = viewModel
        searchTextField.placeholder = viewModel.placeholderText
    }
}
// MARK: - UILayout
extension NoteListTopView {
    private func addSubViews() {
        addHamburgerIconButton()
        addSearchTextField()
        addProfileButton()
        addCancelButton()
    }
    
    private func addHamburgerIconButton() {
            addSubview(hamburgerIconButton)
            hamburgerIconButton.height(16)
            hamburgerIconButton.width(18)
            hamburgerIconButton.leftToSuperview().constant = 20
            hamburgerIconButton.bottomToSuperview().constant = -28
    }
    
    private func addSearchTextField() {
            addSubview(searchTextField)
            searchTextField.topToSuperview()
            searchTextField.leadingToSuperview().constant = 75
            searchTextField.trailingToSuperview().constant = -75
            searchTextField.height(40)
            searchTextField.bottomToSuperview().constant = -16
            searchTextField.withImage(direction: .left,
                                      image: .icSearch,
                                      colorSeparator: UIColor.white,
                                      colorBorder: .lightGray,
                                      backgroundColor: .white)
    }
    
    private func addProfileButton() {
         addSubview(profileButton)
         profileButton.trailingToSuperview().constant = -20
         profileButton.topToSuperview().constant = 5
         profileButton.width(32)
         profileButton.height(32)
     }
    
    private func addCancelButton() {
           addSubview(cancelButton)
           cancelButton.trailingToSuperview().constant = 18
           cancelButton.bottomToSuperview().constant = 31
           cancelButton.width(40)
           cancelButton.height(9)
     }
}
// MARK: - Actions
extension NoteListTopView {
    @objc
    private func hamburgerButtonTapped(_ sender: Any?) {
        hamburgerButtonTapped?()
    }
    @objc
    private func profileButtonTapped(_ sender: Any?) {
        profileButtonTapped?()
    }
    @objc
    private func cancelButtonTapped(_ sender: Any?) {
        cancelButtonTapped?()
    }
    @objc
    private func textSearchChange(_ sender: UITextField) {
        searchTextFieldTapped?(sender.text ?? "")
    }
}
// MARK: - SetLocalize & ConfigureContents()
extension NoteListTopView {
    private func configureContents() {
        hamburgerIconButton.addTarget(self, action: #selector(hamburgerButtonTapped(_:)), for: .touchUpInside)
        searchTextField.addTarget(self, action: #selector(textSearchChange(_:)), for: .editingChanged)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profileButtonTapped(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func setLocalize() {
        searchTextField.placeholder = L10n.NoteListTop.searchPlace
        cancelButton.titleLabel?.text = L10n.NoteListTop.cancel
    }
}
