//
//  SquareEmployeeDirectoryTests.swift
//  SquareEmployeeDirectoryTests
//
//  Created by Alexander Adgebenro on 9/8/22.
//

import XCTest
@testable import SquareEmployeeDirectory

class SquareEmployeeDirectoryTests: XCTestCase {
    
    var viewModel: EmployeeViewModel!
    var mockUserService: NetworkMockService!
    
    override func setUp() {
        mockUserService = NetworkMockService(result: Result<[EmployeeData], APIError>.success([EmployeeData].init()))
                                             
        viewModel = .init(service: mockUserService)
    }
    override func tearDown() {
        mockUserService = nil
        viewModel = nil
    }
    
    func test_employee_fetching_success() async throws {
        viewModel.fetchAllEmployees()
    }
    
    
}
