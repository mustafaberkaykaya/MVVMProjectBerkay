//
//  AddNoteViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

import Foundation

protocol AddNoteViewDataSource {}

protocol AddNoteViewEventSource {}

protocol AddNoteViewProtocol: AddNoteViewDataSource, AddNoteViewEventSource {}

final class AddNoteViewModel: BaseViewModel<AddNoteRouter>, AddNoteViewProtocol {
    
}
