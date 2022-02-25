//
//  NoteUpdateRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 25.02.2022.
//

public struct NoteUpdateRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = CreateNoteResponse
    
    public var path: String
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(title: String, description: String, noteId: Int) {
        parameters["title"] = title
        parameters["note"] = description
        path = "notes/\(noteId)"
    }
    
}
