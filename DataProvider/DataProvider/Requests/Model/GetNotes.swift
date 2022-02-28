//
//  GetNotes.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

// MARK: - GetNotes
public struct GetNotes: Codable {
 public let code: String?
 public let data: Notes
 public let message: String?
}

// MARK: - Notes
public struct Notes: Codable {
 public let currentPage: Int?
 public let data: [Note]
}
