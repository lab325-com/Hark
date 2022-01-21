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
    let harkRequests: [HarkRequestsModel]
    
    enum CodingKeys: String, CodingKey {
        case harks = "Harks"
        case pagination = "Pagination"
        case harkRequests = "HarkRequests"
    }
}

struct HarksListModel: Codable {
    let id: String
    let nickName: String
    let status: String
}

struct PaginationModel: Codable {
    let total: Int
    let totalPages: Int
    let nextPageExists: Bool
    let previousPageExists: Bool
}

struct HarkRequestsModel: Codable {
    let id: String
    let talk: TalkModel
    let sentByYou: Bool
    let sentToYou: Bool
    let status: HarkRequestStatus
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case talk = "Talk"
        case sentByYou = "sentByYou"
        case sentToYou = "sentToYou"
        case status = "status"
    }
}

struct TalkModel: Codable {
    let id: String
    let duration: IntervalRepresentationModel
    let createdAt: String
}

struct IntervalRepresentationModel: Codable {
    let hours: Int
    let minutes: Int
    let seconds: Int
}

extension HarkRequestStatus: Codable {
    
}
