//
//  Employee.swift
//  BMTask
//
//  Created by Hamdy Youssef on 13/08/2023.
//

import Foundation

struct Employee: Decodable {
//    let id: Int
    let name: String
//    let salary: Int
//    let age: Int
//    let profile_image: String
    
    enum CodingKeys: String, CodingKey {
//        case id
        case name = "employee_name"
//        case salary = "employee_salary"
//        case age = "employee_age"
    }
}
