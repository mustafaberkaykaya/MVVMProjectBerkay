//
//  ChangePasswordRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

public struct ChangePasswordRequest: ApiDecodableResponseRequest {
    
    public typealias ResponseType = DeleteNoteResponse
    
    public var path: String = "users/me/password"
    public var method: RequestMethod = .put
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(password: String, newPassword: String, newPasswordConfirmation: String) {
        parameters["password"] = password
        parameters["new_password"] = newPassword
        parameters["new_password_confirmation"] = newPasswordConfirmation
    }
}
