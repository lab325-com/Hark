//
//  HarksModel.swift
//  Hark
//
//  Created by Andrey S on 20.01.2022.
//

import Foundation

struct HarksModel: Codable {
    let harks: HarksMainModel
}

struct HarksMainModel: Codable {
    let harks: [HarksListModel]
    let pagination: PaginationModel
    
    enum CodingKeys: String, CodingKey {
        case harks = "Harks"
        case pagination = "Pagination"
    }
}

struct HarksListModel: Codable {
    let id: String
    let nickName: String?
    var status: UserStatusType
    
    mutating func changeStatus(_ status: UserStatusType) {
        self.status = status
    }
}

extension UserStatusType: Codable {
    
}
