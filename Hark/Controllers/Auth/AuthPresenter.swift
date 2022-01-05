//
//  RegistrationPhonePresenter.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol AuthPhoneOutputProtocol: BaseController {
    func successRegister(smsToken: String)
    
    func successGuest(authToken: String)
    
    func successValidata()
    func failureValidate()
}

extension AuthPhoneOutputProtocol {
    func successRegister(smsToken: String) {}
    func successGuest(authToken: String) {}
    func successValidata() {}
    func failureValidate() {}
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol AuthPresenterProtocol: AnyObject {
    init(view: AuthPhoneOutputProtocol)
    
    func registePhone(phone: String)
    func validate(smsToken: String, code: Int)
}

class AuthPresenter: AuthPresenterProtocol {
    
    private weak var view: AuthPhoneOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    private let udid = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
    
    required init(view: AuthPhoneOutputProtocol) {
        self.view = view
    }
    
    func registePhone(phone: String) {
        view?.startLoader()
        
        request?.cancel()
        
        let mutation = LoginMutation(record: LoginRecordInput(authType: .accountTypeSms, udid: udid, phone: phone))

        request = Network.shared.mutation(model: LoginModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successRegister(smsToken: model.login.smsToken)
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
    
    func validate(smsToken: String, code: Int) {
        view?.startLoader()
        
        request?.cancel()
        
        
        let mutation = VerifyPhoneMutation(smsToken: smsToken, code: code)

        request = Network.shared.mutation(model: VerifyPhoneModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successValidata()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failureValidate()
        }
    }
    
    func guest() {
        view?.startLoader()
        
        request?.cancel()
        
        let mutation = LoginMutation(record: LoginRecordInput(authType: .accountTypeUdid, udid: udid))

        request = Network.shared.mutation(model: LoginModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            
            if let token = model.login.authToken {
                self?.view?.successGuest(authToken: token)
            }
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
