//
//  LoginModel.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import Foundation

struct LoginModel: Codable {
    let login: LoginMainModel
}

struct LoginMainModel: Codable {
    let authToken: String
    let smsToken: String
}
