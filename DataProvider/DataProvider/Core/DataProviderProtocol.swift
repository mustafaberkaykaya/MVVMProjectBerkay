//
//  DataProviderProtocol.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 11.02.2022.
//

import Foundation

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
