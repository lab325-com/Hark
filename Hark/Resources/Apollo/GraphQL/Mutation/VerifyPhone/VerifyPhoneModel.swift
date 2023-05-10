//
//  VerifyPhoneModel.swift
//  Hark
//
//  Created by mob325 on 05.01.2022.
//

import Foundation

struct VerifyPhoneModel: Codable {
    let verifyPhone: VerifyMainModel
}

struct VerifyMainModel: Codable {
    let authToken: String
}
