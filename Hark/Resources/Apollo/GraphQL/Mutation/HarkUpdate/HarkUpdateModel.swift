//
//  DeleteHarkRequestModel.swift
//  Hark
//
//  Created by mob325 on 31.01.2022.
//

import Foundation

struct HarkUpdateModel: Codable {
    let harkUpdate: HarkUpdateMainModel
}

struct HarkUpdateMainModel: Codable {
    let id: String
    let nickName: String
    let status: UserStatusType
}
