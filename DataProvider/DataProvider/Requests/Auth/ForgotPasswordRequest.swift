//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

public struct ForgotPasswordRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = ForgotPassword
    
    public var path: String = "auth/forgot-password"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
}
