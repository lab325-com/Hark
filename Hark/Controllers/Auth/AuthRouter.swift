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
    
    func pushLoginPhone() {
        let controller = LoginPhoneController()
        push(controller: controller)
    }
    
    func pushRegistrationVerification(phoneNumber: String) {
        let controller = RegistrationVerificationController(phoneNumber: phoneNumber)
        push(controller: controller)
    }
    
    func pushLoginVerification(phoneNumber: String) {
        let controller = LoginVerificationController(phoneNumber: phoneNumber)
        push(controller: controller)
    }
    
}
