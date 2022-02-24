//
//  AddNoteViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

import Foundation

protocol AddNoteViewDataSource {
    var titleText: String { get set }
    var descriptionText: String { get set }
    var noteId: Int { get set }
    var type: DetailVCShowType { get set }
    
}

protocol AddNoteViewEventSource {}

protocol AddNoteViewProtocol: AddNoteViewDataSource, AddNoteViewEventSource {
    func addNote(title: String, description: String)
}

final class AddNoteViewModel: BaseViewModel<AddNoteRouter>, AddNoteViewProtocol {
    var type: DetailVCShowType
    var titleText: String
    var descriptionText: String
    var noteId: Int
    
    init(type: DetailVCShowType, titleText: String, descriptionText: String, noteId: Int,   router: AddNoteRouter) {
        self.type = type
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.noteId = noteId
        super.init(router: router)
    }
    
    func addNote(title: String, description: String) {
        dataProvider.request(for: AddNoteRequest(title: title, description: description)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                print(response)
                NotificationCenter.default.post(name: .reloadDataNotification, object: nil)
                self.router.close()
            case .failure(let err):
            print(err.localizedDescription)
            }
        }
    }
}
