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
    
    let queue = DispatchQueue(label: "com.mobillium.noteberkaymvvm.networklogger")
    
    func request(_ request: Request, didCreateURLRequest urlRequest: URLRequest) {
        print("---> Request Created <---")
        print(request.description)
    }
    
    func requestDidFinish(_ request: Request) {
        print("---> Request Finished <---")
        print(request.description)
    }
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("---> Request JSONResponse <---")
        if let data = response.data, let json = String(data: data, encoding: .utf8) {
            print(json)
        }
    }
}
