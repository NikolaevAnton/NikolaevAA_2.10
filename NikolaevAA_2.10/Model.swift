//
//  Model.swift
//  NikolaevAA_2.10
//
//  Created by Anton Nikolaev on 25.11.2021.
//

import Foundation

struct Model: Decodable {
    let name: String?
    let age: Int?
    let count: Int?
    
    var description: String {
        """
        Name: \(name ?? "")
        Age: \(age ?? 0)
        Count: \(count ?? 0)
        """
    }
}
