//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 21.02.2022.
//

public struct LoginRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public var path: String = "auth/login"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
    
}
