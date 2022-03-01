//
//  GetUserResponse.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import Foundation

public struct GetUserResponse: Codable {
    public let code: String?
    public let data: User?
    public let message: String?
}

// MARK: - User
public struct User: Codable {
    public var id: Int?
    public var fullName: String?
    public var email: String?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case email
    }
    
    public init(id: Int, userName: String, email: String) {
        self.id = id
        self.fullName = userName
        self.email = email
    }
}
