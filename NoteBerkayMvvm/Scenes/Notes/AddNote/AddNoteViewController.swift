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
        setLocalize()
        configureContents()
        addSubViews()
    }
}
// MARK: - UILayout
extension AddNoteViewController {
    private func addSubViews() {
        addMainStackView()
        addTitleNote()
        addDescriptionTextView()
        switch viewModel.type {
        case .showNote:
            descriptionTextView.isEditable = false
            titleTextField.isEnabled = false
        case .add:
            addSaveNoteButton()
        case .update:
            addSaveNoteButton()
        }
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
        saveNoteButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setLocalize() {
        saveNoteButton.buttonTitle = L10n.AddNote.save
        titleTextField.text = viewModel.titleText
        descriptionTextView.text = viewModel.descriptionText
    }
}

// MARK: - Actions
extension AddNoteViewController {
    @objc
    private func saveButtonTapped() {
        let validation = Validation()
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        guard validation.isValidAnyText(title) else { return }
        guard validation.isValidAnyText(description) else { return }
        if viewModel.type == .add {
            viewModel.addNote(title: title, description: description)
        } else if viewModel.type == .update {
            viewModel.updateNote(title: title, description: description, noteID: viewModel.noteId)
        }
    }
}
