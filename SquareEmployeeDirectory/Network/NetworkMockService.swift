//
//  NetworkMockService.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/8/22.
//

import Foundation

struct NetworkMockService: NetWorkManagerProtocol {
    
    var result: Result<[EmployeeData], APIError>
    
    func fetchAllEmployees(url: URL?, completion: @escaping (Result<[EmployeeData], APIError>) -> Void) {
        completion(result)
    }

}
