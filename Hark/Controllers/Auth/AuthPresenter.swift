//
//  RegistrationPhonePresenter.swift
//  Hark
//
//  Created by mob325 on 05.01.2022.
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
    func successGoToRoot()
    
    func successValidata()
    func failureValidate()
}

extension AuthPhoneOutputProtocol {
    func successRegister(smsToken: String) {}
    func successGuest(authToken: String) {}
    func successGoToRoot() {}
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
        
        let mutation = LoginMutation(record: LoginRecordInput(phone: phone, authType: .accountTypeSms))

        request = Network.shared.mutation(model: LoginModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            if let smsToken = model.login.smsToken {
                self?.view?.successRegister(smsToken: smsToken)
            }
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
    
    func validate(smsToken: String, code: Int) {
        view?.startLoader()
        
        request?.cancel()
        
        let mutation = VerifyPhoneMutation(smsToken: smsToken, verificationCode: code)

        request = Network.shared.mutation(model: VerifyPhoneModel.self, mutation, controller: view) { [weak self] model in
            
            let token = model.verifyPhone.authToken
            let query = MeQuery()
            KeychainService.standard.newAuthToken = AuthModel(token: token)
            
            let _ = Network.shared.query(model: MeModel.self, query, controller: self?.view) { [weak self] model in
                self?.view?.stopLoading()
                
                KeychainService.standard.me = model.me
                
                if model.me.profileFilled == true {
                    self?.view?.successGoToRoot()
                } else {
                    self?.view?.successValidata()
                }
            } failureHandler: { [weak self] error in
                debugPrint(error)
                self?.view?.stopLoading()
            }
    
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failureValidate()
        }
    }
    
    func guest() {
        view?.startLoader()
        
        request?.cancel()
        
        let mutation = LoginMutation(record: LoginRecordInput(udid: udid, authType: .accountTypeUdid))

        request = Network.shared.mutation(model: LoginModel.self, mutation, controller: view) { [weak self] model in
            if let token = model.login.authToken {
                let query = MeQuery()
                KeychainService.standard.newAuthToken = AuthModel(token: token)
                
                let _ = Network.shared.query(model: MeModel.self, query, controller: self?.view) { [weak self] model in
                    self?.view?.stopLoading()
                    KeychainService.standard.me = model.me
                    
                    if model.me.profileFilled == true {
                        self?.view?.successGoToRoot()
                    } else {
                        self?.view?.successGuest(authToken: token)
                    }
                } failureHandler: { [weak self] error in
                    debugPrint(error)
                    self?.view?.stopLoading()
                }
            } else {
                self?.view?.stopLoading()
            }
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
