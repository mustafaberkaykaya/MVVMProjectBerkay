//
//  NoteListCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import Foundation

public protocol NoteListCellDataSource: AnyObject {
    
}

public protocol NoteListCellEventSource: AnyObject {
    
}

public protocol NoteListCellProtocol: NoteListCellDataSource, NoteListCellEventSource {
    
}

public final class NoteListCellModel: NoteListCellProtocol {
    
}
