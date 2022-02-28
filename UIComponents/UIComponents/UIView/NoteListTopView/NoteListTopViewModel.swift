//
//  NoteListTopViewModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 28.02.2022.
//

import Foundation

public protocol NoteListTopViewDataSource: AnyObject {
    
}

public protocol NoteListTopViewEventSource: AnyObject {
    
}

public protocol NoteListTopViewProtocol: NoteListTopViewDataSource, NoteListTopViewEventSource {
    
}

public final class NoteListTopViewModel: NoteListTopViewProtocol {
    
}
