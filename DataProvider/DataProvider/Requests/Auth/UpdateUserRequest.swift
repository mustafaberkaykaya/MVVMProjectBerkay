//
//  UpdateUserRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

public struct UpdateUserRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = GetUserResponse
    
    public var path: String = "users/me"
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(userName: String, email: String) {
        parameters["full_name"] = userName
        parameters["email"] = email
    }
}
