//
//  DecodableResponseRequest.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 11.02.2022.
//

import Foundation

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
