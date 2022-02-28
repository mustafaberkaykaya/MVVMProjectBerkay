//
//  NotesListViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import Foundation

protocol NotesListViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> NoteListCellProtocol
}

protocol NotesListViewEventSource {
    var didSuccessFetchRecipes: VoidClosure? { get set }
}

protocol NotesListViewProtocol: NotesListViewDataSource, NotesListViewEventSource {
    func configureRow(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
    func getMyNotes()
    func deleteNote(noteID: Int)
}

final class NotesListViewModel: BaseViewModel<NotesListRouter>, NotesListViewProtocol {
    
    var didSuccessFetchRecipes: VoidClosure?
    var cellItems: [NoteListCellProtocol] = [NoteListCellModel(title: "", description: "", noteID: 0)]
    
    func cellItemAt(indexPath: IndexPath) -> NoteListCellProtocol {
        let item = cellItems[indexPath.row]
        return item
    }

    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func configureRow(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        router.pushNote(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
        if type == .update {
            self.didSuccessFetchRecipes?()
        }
    }
    
    func getMyNotes() {
        dataProvider.request(for: GetMyNotesRequest()) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.cellItems.removeAll(keepingCapacity: false)
                let cellItems = response.data.data.map({ NoteListCellModel(title: $0.title ?? "", description: $0.note ?? "", noteID: $0.id ?? 0)})
                self.cellItems.append(contentsOf: cellItems)
                self.didSuccessFetchRecipes?()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func deleteNote(noteID: Int) {
        dataProvider.request(for: NoteDeleteRequest(noteId: noteID)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success:
                self.getMyNotes()
                self.didSuccessFetchRecipes?()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
