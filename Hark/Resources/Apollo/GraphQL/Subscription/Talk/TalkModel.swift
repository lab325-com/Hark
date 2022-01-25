//
//  TalkModel.swift
//  Hark
//
//  Created by Andrey S on 25.01.2022.
//

import Foundation

struct TalkSubscriptionModel: Codable {
    let talk: TalkSubscriptionMainModel
}

struct TalkSubscriptionMainModel: Codable {
    let event: SubscriptionEventType
    let declinedBy: String?
    let finishedBy: String?
}

extension SubscriptionEventType: Codable {
    
}
