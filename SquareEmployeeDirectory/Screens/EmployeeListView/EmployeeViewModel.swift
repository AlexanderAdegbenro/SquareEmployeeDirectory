//
//  EmployeeListViewModel.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/2/22.
//

import SwiftUI

final class EmployeeViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    @Published var employees: [EmployeeData] = []
    
    
    let service: NetWorkManagerProtocol
    
    init(service: NetWorkManagerProtocol = NetworkManager()) {
        self.service = service
        fetchAllEmployees()
    }
    
    func fetchAllEmployees() {
        isLoading = true
        
        let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")
        
        service.fetchAllEmployees(url: url) { [unowned self]  result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                    
                case .success(let employees):
                    
                    self.employees = employees
                    
                    print("--- success fetching \(employees.count) employees")
                    
                case .failure(let error):
                    switch error {
                case  .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                    
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                    
                case .invalidData:
                    alertItem = AlertContext.invalidData
                    
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                        
                    }
                }
            }
        }
        
    }
}





