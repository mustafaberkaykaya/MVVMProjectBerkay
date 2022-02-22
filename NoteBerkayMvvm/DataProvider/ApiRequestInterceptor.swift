//
//  ApiRequestInterceptor.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 14.02.2022.
//

import Foundation
import Alamofire
import KeychainSwift

public class ApiRequestInterceptor: RequestInterceptor {
    
    public static let shared = ApiRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let accessToken = KeychainSwift().get(Keychain.token)
        
        if let accessToken = accessToken {
            urlRequest.headers.add(name: "token", value: accessToken)
        }
        completion(.success(urlRequest))
    }
}
