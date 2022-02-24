//
//  AddNoteViewController.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

final class AddNoteViewController: BaseViewController<AddNoteViewModel> {
    
    private let mainStackView = UIStackViewBuilder()
        .spacing(19)
        .axis(.vertical)
        .distribution(.fill)
        .build()
    private let titleTextField = AuthTextField()
    private let descriptionTextView = UITextViewBuilder().build()
    private let saveNoteButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
    
}
// MARK: - UILayout
extension AddNoteViewController {
    private func addSubViews() {
        addMainStackView()
        addTitleNote()
        addDescriptionTextView()
        addSaveNoteButton()
    }
    
    private func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.topToSuperview(usingSafeArea: true).constant = 28
        mainStackView.leadingToSuperview().constant = 20
        mainStackView.trailingToSuperview().constant = -20
        mainStackView.bottomToSuperview(usingSafeArea: true)
    }
    
    private func addSaveNoteButton() {
        view.addSubview(saveNoteButton)
        saveNoteButton.centerXToSuperview()
        saveNoteButton.bottomToSuperview(usingSafeArea: true).constant = -77
        saveNoteButton.height(42)
    }
    
    private func addTitleNote() {
        mainStackView.addArrangedSubview(titleTextField)
    }
    
    private func addDescriptionTextView() {
        mainStackView.addArrangedSubview(descriptionTextView)
        descriptionTextView.backgroundColor = .green
    }
    
}

// MARK: - Configure & Set Localize
extension AddNoteViewController {
    private func configureContents() {
        setLocalize()
        
        saveNoteButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        saveNoteButton.buttonTitle = L10n.AddNote.save
    }
}

// MARK: - Actions
extension AddNoteViewController {
    @objc
    private func saveButtonTapped() {
        print("calss")
    }
}
