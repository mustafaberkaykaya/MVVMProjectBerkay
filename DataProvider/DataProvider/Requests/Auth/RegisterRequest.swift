//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 21.02.2022.
//

public struct RegisterRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public var path: String = "auth/register"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(fullName: String, email: String, password:String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
        parameters["password"] = password
    }
}
