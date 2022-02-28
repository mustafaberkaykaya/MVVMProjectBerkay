//
//  CreateNoteResponse.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

public struct CreateNoteResponse: Codable {
    let code: String?
    let data: Note?
    let message: String?
}
