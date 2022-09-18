//
//  NetworkManagerProtocol.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/8/22.
//

import Foundation
protocol NetWorkManagerProtocol {
    func fetchAllEmployees(url: URL?, completion: @escaping(Result<[EmployeeData], APIError>) -> Void)  
}
