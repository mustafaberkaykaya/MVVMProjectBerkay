//
//  ApiLogger.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 14.02.2022.
//

import Foundation
import Alamofire

final class ApiLogger: EventMonitor {
    static let shared = ApiLogger()
    let queue = DispatchQueue(label: "com.mobillium.mvvmnoteberkay.networklogger")
    
    func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        print("<------------------->Request Created<------------------------->")
        print(request.description)
    
    if let httpBody = urlRequest.httpBody, let parameters = String(data: httpBody, encoding: .utf8) {
        print("Parameters:")
        print(parameters)
  }
    if let requestHeader = urlRequest.allHTTPHeaderFields {
        print("Headers:")
        print(requestHeader)
  }
    print("<------------------->End Of Request Created<------------------->")
}
        
   func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
    print("<------------------->Success Response------------------------->")
    print(request.description)
    if let data = response.data, let json = String(data: data, encoding: .utf8) {
        print(json)
    }
        print("<------------------->End Of Success Response<------------------->")
    }
    
    func request(_ request: Request, didCompleteTask task: URLSessionTask, with error: AFError?) {      guard let error = error else { return }
        print("<------------------->Error Response<-------------------------->")
        print("Request Description: \(request.description)")
        print("Error Description: \(String(describing: error.errorDescription))")
        print("<------------------->End Of Error Response<------------------->")
    }
}
