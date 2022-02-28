//
//  NoteListCellModel+Extension.swift.swift
//  UIComponents
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

extension NoteListCellModel {
    convenience init(note: Note) {
        self.init(title: note.title ?? "",
                  description: note.note ?? "",
                  noteID: note.id ?? 0 )
    }
}
