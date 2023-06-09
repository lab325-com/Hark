//
//  CallHarkModel.swift
//  Hark
//
//  Created by mob325 on 27.01.2022.
//

import Foundation

struct CallHarkModel: Codable {
    let callHark: CallHarkMainModel
}

struct CallHarkMainModel: Codable, CallProtocol {
    let talkId: String
    let uid: UInt
    let channelName: String
    let token: String
    let matchedUserId: String
    let user: UserBaseModel
}
