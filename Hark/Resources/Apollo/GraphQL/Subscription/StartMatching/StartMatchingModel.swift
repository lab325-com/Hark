//
//  StartMatchingModel.swift
//  Hark
//
//  Created by Andrey S on 25.01.2022.
//

import Foundation

struct StartMatchingModel: Codable {
    let startMatching: StartMatchingMainModel
}

struct StartMatchingMainModel: Codable, CallProtocol {
    let token: String
    let talkId: String
    let uid: UInt
    let channelName: String
    let role: TalkRoleName
    let matchedUserId: String
    let user: UserBaseModel
    
    enum CodingKeys: String, CodingKey {
        case user = "User"
        case token = "token"
        case talkId = "talkId"
        case uid = "uid"
        case channelName = "channelName"
        case role = "role"
        case matchedUserId = "matchedUserId"
    }
}



extension TalkRoleName: Codable {
}
