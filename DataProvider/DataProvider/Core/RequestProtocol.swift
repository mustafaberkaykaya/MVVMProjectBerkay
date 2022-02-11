//
//  RequestProtocol.swift
//  DataProvider
//
//  Created by Mustafa Berkay Kaya on 11.02.2022.
//

import Foundation

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
