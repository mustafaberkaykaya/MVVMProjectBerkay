//
//  AddNoteViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

import Foundation

protocol AddNoteViewDataSource {}

protocol AddNoteViewEventSource {}

protocol AddNoteViewProtocol: AddNoteViewDataSource, AddNoteViewEventSource {
    func addNote(title: String, description: String)
}

final class AddNoteViewModel: BaseViewModel<AddNoteRouter>, AddNoteViewProtocol {
    func addNote(title: String, description: String) {
        dataProvider.request(for: AddNoteRequest(title: title, description: description)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response)
                self.router.close()
            case .failure(let err):
            print(err.localizedDescription)
            }
        }
    }
}
