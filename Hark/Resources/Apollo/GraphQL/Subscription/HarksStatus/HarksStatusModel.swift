//
//  HarksStatusModel.swift
//  Hark
//
//  Created by mob325 on 24.01.2022.
//

import Foundation

struct HarksStatusModel: Codable {
    let harksStatus: HarksMainStatusModel
}

struct HarksMainStatusModel: Codable {
    let userId: String
    let status: UserStatusType
}
