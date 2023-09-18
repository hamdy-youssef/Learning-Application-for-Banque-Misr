//
//  Media.swift
//  BMTask
//
//  Created by Hamdy Youssef on 14/08/2023.
//

import Foundation


struct Media: Decodable {
    let kind: String
    let artistName: String
    let previewUrl: String?
    let artworkUrl100: String
    let trackName: String
}
