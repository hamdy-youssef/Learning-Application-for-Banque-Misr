//
//  MediaResponse.swift
//  BMTask
//
//  Created by Hamdy Youssef on 14/08/2023.
//

import Foundation


struct MediaResponse: Decodable {
    let resultCount: Int
    let results: [Media]
    }
