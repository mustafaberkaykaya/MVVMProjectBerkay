//
//  NoteDeleteRequestRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 25.02.2022.
//

public struct NoteDeleteRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public var path: String
    public var method: RequestMethod = .delete
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(noteId: Int) {
        path = "notes/\(noteId)"
    }
    
}
