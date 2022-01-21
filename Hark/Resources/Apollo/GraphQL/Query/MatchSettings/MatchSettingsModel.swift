//
//  MatchSettingsModel.swift
//  Hark
//
//  Created by Andrey S on 20.01.2022.
//

import Foundation

struct MatchSettingsModel: Codable {
    let matchSettings: MatchSettingsMainModel
}

struct MatchSettingsMainModel: Codable {
    let style: Int?
    let mood: Int?
    let fromAge: Int?
    let toAge: Int?
    let genders: [GenderType]?
}
