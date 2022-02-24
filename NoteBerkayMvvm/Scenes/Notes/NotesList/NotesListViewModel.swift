//
//  NotesListViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import Foundation

protocol NotesListViewDataSource {

}

protocol NotesListViewEventSource {
    
}

protocol NotesListViewProtocol: NotesListViewDataSource, NotesListViewEventSource {
    func addNoteTapped()
}

final class NotesListViewModel: BaseViewModel<NotesListRouter>, NotesListViewProtocol {
    func addNoteTapped() {
        router.pushAddNote()
    }
}
