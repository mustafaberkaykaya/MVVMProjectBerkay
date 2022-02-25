//
//  GetMyNotesRequestRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

public struct GetMyNotesRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetNotes
    
    public var path: String = "users/me/notes"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
