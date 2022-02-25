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
    var noteID: Int = 0
    var type: DetailVCShowType = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        titleTextField.text = viewModel.titleText
        descriptionTextView.text = viewModel.descriptionText
        noteID = viewModel.noteId
        type = viewModel.type
        
        configureContents()
        addSubViews()
    }
    
}
// MARK: - UILayout
extension AddNoteViewController {
    private func addSubViews() {
        descriptionTextView.delegate = self
        switch type {
        case .showNote:
            addMainStackView()
            addTitleNote()
            addDescriptionTextView()
            descriptionTextView.isEditable = false
            titleTextField.isEnabled = false
        case .add:
            addMainStackView()
            addTitleNote()
            addDescriptionTextView()
            addSaveNoteButton()
            saveNoteButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        case .update:
            addMainStackView()
            addTitleNote()
            addDescriptionTextView()
            addSaveNoteButton()
            saveNoteButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
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
        setLocalize()
    }
    
    private func setLocalize() {
        saveNoteButton.buttonTitle = L10n.AddNote.save
    }
}

// MARK: - Actions
extension AddNoteViewController {
    @objc
    private func saveButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        viewModel.addNote(title: title, description: description)
    }
    
    @objc
    func updateButtonTapped() {
        let title = titleTextField.text ?? ""
        let description = descriptionTextView.text ?? ""
        viewModel.updateNote(title: title, description: description, noteID: noteID)
    }
}
extension AddNoteViewController: UITextViewDelegate {
    
}
