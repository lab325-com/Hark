//
//  AuthPresenter.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import Foundation

class AuthRouter: BaseRouter {
    
    func pushRegistrationPhone() {
        let controller = RegistrationPhoneController()
        push(controller: controller)
    }
}
