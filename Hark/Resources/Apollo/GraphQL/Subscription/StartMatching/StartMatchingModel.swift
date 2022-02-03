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
}

extension TalkRoleName: Codable {
}
