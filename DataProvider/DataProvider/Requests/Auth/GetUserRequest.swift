//
//  GetUserRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

public struct GetUserRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetUserResponse
    
    public var path: String = "users/me"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
