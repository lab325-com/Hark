//
//  UserBaseModel.swift
//  Hark
//
//  Created by mob325 on 08.02.2022.
//

import Foundation

struct UserBaseModel: Codable {
    let id: String
    let nickName: String
    let age: Int
    let gender: GenderType
}

extension GenderType {
    var matchGender: String {
        switch self {
        case .genderTypeCommon:
            return "Common"
        case .genderTypeMan:
            return "Male"
        case .genderTypeWoman:
            return "Female"
        case .__unknown(_):
            return "Unknown"
        }
    }
}
