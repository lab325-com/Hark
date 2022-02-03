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
        controller.hidesBottomBarWhenPushed = true
        push(controller: controller)
    }
    
    func pushLoginPhone() {
        let controller = LoginPhoneController()
        push(controller: controller)
    }
    
    func pushRegistrationVerification(phoneNumber: String, smsToken: String) {
        let controller = RegistrationVerificationController(phoneNumber: phoneNumber, smsToken: smsToken)
        push(controller: controller)
    }
    
    func pushLoginVerification(phoneNumber: String, smsToken: String) {
        let controller = LoginVerificationController(phoneNumber: phoneNumber, smsToken: smsToken)
        push(controller: controller)
    }
    
    func pushAuthFillNickName() {
        let controller = AuthFillNickNameController()
        push(controller: controller)
    }
    
    func pushAuthFillAge(nickName: String) {
        let controller = AuthFillAgeController(nickName: nickName)
        push(controller: controller)
    }
    
    func pushAuthGender(nickName: String, age: Int) {
        let controller = AuthFillGenderController(nickName: nickName, age: age)
        push(controller: controller)
    }
}
