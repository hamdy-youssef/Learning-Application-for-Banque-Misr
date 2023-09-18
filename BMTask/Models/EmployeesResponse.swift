//
//  EmployeesResponse.swift
//  BMTask
//
//  Created by Hamdy Youssef on 13/08/2023.
//

import Foundation

struct EmployeesResponse: Decodable {
    let status: String
    let data: [Employee]
    let message: String
}
