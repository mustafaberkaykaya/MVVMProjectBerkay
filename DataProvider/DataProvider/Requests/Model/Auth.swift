//
//  Auth.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 21.02.2022.
//
public struct Auth: Codable {
  public let code: String?
  public let data: DataClass?
  public let message: String?
}

// MARK: - DataClass
public struct DataClass: Codable {
    public let accessToken: String?
    public let tokenType: String?
             
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
