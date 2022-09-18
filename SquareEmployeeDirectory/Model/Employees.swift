//
//  Employee.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/2/22.
//

import Foundation

struct EmployeeData: Codable, Hashable {
    
    let uuid: String
    let full_name: String
    let phone_number: String
    let email_address: String
    let biography: String
    let photo_url_small: String
    let photo_url_large: String
    let team: String
    let employee_type: employee_type_enum!
    
}
enum employee_type_enum : String, Codable {
    case FULL_TIME, PART_TIME, CONTRACTOR
}

struct Employees: Codable {
    var employees: [EmployeeData] = []
}


