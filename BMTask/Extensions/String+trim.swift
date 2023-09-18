//
//  String+trim.swift
//  BMTask
//
//  Created by Hamdy Youssef on 06/08/2023.
//

import Foundation
import UIKit

extension String {
    var trimm: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
