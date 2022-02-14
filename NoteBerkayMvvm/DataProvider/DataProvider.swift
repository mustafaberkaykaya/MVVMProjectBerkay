//
//  DataProvider.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 14.02.2022.
//

import Foundation
#if DEBUG
let apiDataProvider = ApiDataProvider(interceptor: ApiRequestInterceptor.shared,
                                      eventMonitors: [ApiLogger.shared])
#else
let apiDataProvider = ApiDataProvider(interceptor: ApiRequestInterceptor.shared,
                                      eventMonitors: [])
#endif
