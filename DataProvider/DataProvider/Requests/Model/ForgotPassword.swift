//
//  ForgotPassword.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

public struct ForgotPassword: Codable {
    public let code: String?
    public let data: DataClass?
    public let message: String?
}
