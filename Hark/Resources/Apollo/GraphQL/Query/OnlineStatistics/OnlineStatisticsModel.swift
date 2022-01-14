//
//  OnlineStatisticsModel.swift
//  Hark
//
//  Created by Andrey S on 11.01.2022.
//

import Foundation

struct OnlineStatisticsModel: Codable {
    let onlineStatistics: OnlineStatisticsMainModel
}

struct OnlineStatisticsMainModel: Codable {
    let totalCommons: Int?
    let totalInTalk: Int?
    let totalMen: Int?
    let totalOnline: Int?
    let totalWomen: Int?
}
