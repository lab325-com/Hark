//
//  ProfilePresenter.swift
//  Hark
//
//  Created by Andrey S on 12.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol ProfilePhoneOutputProtocol: BaseController {
    func success()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol ProfilePresenterProtocol: AnyObject {
    init(view: ProfilePhoneOutputProtocol)
    
    func updateProfile(age: Int?, gender: GenderType, nickName: String?, hideStatus: Bool?)
}

class ProfilePresenter: ProfilePresenterProtocol {
    
    private weak var view: ProfilePhoneOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    required init(view: ProfilePhoneOutputProtocol) {
        self.view = view
    }
    
    func updateProfile(age: Int?, gender: GenderType, nickName: String?, hideStatus: Bool?) {
        request?.cancel()
        
        let mutation = ProfileUpdateMutation(record: ProfileUpdateInput(nickName: nickName, age: age, gender: gender, hideStatus: hideStatus))

        request = Network.shared.mutation(model: ProfileUpdateModel.self, mutation, controller: view) { [weak self] model in
            KeychainService.standard.me = model.profileUpdate
            self?.view?.success()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
