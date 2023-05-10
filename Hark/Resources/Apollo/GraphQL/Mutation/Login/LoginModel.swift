//
//  LoginModel.swift
//  Hark
//
//  Created by mob325 on 05.01.2022.
//

import Foundation

struct LoginModel: Codable {
    let login: LoginMainModel
}

struct LoginMainModel: Codable {
    let authToken: String?
    let smsToken: String?
}
