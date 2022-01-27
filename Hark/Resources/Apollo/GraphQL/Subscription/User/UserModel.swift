//
//  UserModel.swift
//  Hark
//
//  Created by Andrey S on 27.01.2022.
//

import Foundation

struct UserModel: Codable {
    let user: UserMainModel
}

struct UserMainModel: Codable, CallProtocol {
    let event: SubscriptionEventType
    var talkId: String
    var uid: UInt
    var channelName: String
    var token: String
}
