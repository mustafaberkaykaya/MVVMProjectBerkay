//
//  NoteListCellModel.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

import Foundation

public protocol NoteListCellDataSource: AnyObject {
    var titleText: String { get set }
    var descriptionText: String { get set }
    var noteID: Int { get set }
}

public protocol NoteListCellEventSource: AnyObject {}

public protocol NoteListCellProtocol: NoteListCellDataSource, NoteListCellEventSource {}

public final class NoteListCellModel: NoteListCellProtocol {
    public var titleText: String
    public var descriptionText: String
    public var noteID: Int
    
    public init(title: String, description: String, noteID: Int) {
           self.titleText = title
           self.descriptionText = description
           self.noteID = noteID
       }
}
