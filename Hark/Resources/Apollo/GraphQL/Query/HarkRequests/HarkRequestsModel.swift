//
//  HarkRequestsModel.swift
//  Hark
//
//  Created by Andrey S on 21.01.2022.
//

import Foundation

struct HarkRequestsModel: Codable {
    let harkRequests: HarkMainRequests
}

struct HarkMainRequests: Codable {
    let pagination: PaginationModel
    let harkRequests: [RequestsModel]?
    
    enum CodingKeys: String, CodingKey {
        case pagination = "Pagination"
        case harkRequests = "HarkRequests"
    }
}

struct RequestsModel: Codable {
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
    let duration: IntervalRepresentationModel?
    let createdAt: String
    
    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from:createdAt) ?? Date()
    }
}

struct IntervalRepresentationModel: Codable {
    let hours: Int
    let minutes: Int
    let seconds: Int
}

extension HarkRequestStatus: Codable {
    
}
