//
//  PaginationModel.swift
//  Hark
//
//  Created by mob325 on 21.01.2022.
//

import Foundation

struct PaginationModel: Codable {
    let total: Int
    let totalPages: Int
    let nextPageExists: Bool
    let previousPageExists: Bool
}
