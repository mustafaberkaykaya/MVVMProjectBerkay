//
//  GetNotes.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

// MARK: - GetNotes
public struct GetNotes: Codable {
    public let code: String?
    public let data: Data
    public let message: String?
}

// MARK: - Notes
public struct Data: Codable {
    public let currentPage: Int
    public let data: [Note]
    public let from: Int
    public let lastPage: Int
    public let perPage: Int
    public let to: Int
    public let total: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case from
        case lastPage = "last_page"
        case perPage = "per_page"
        case to
        case total
    }
}

