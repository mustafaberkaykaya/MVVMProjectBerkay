//
//  ResetPassword.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//


public struct ResetPassword: Codable {
    public let code: String?
    public let data: DataClass?
    public let message: String?
}

