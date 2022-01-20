//
//  AuthFillPesenter.swift
//  Hark
//
//  Created by Andrey S on 06.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol AuthFillOutputProtocol: BaseController {
    func successFill()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol AuthFillPresenterProtocol: AnyObject {
    init(view: AuthFillOutputProtocol)
    
    func fillProfile(age: Int, gender: GenderType, nickName: String)
}

class AuthFillPresenter: AuthFillPresenterProtocol {
    
    private weak var view: AuthFillOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    required init(view: AuthFillOutputProtocol) {
        self.view = view
    }
    
    func fillProfile(age: Int, gender: GenderType, nickName: String) {
        view?.startLoader()
        
        request?.cancel()
        
        let mutation = ProfileUpdateMutation(record: ProfileUpdateInput(nickName: nickName, age: age, gender: gender))

        request = Network.shared.mutation(model: ProfileUpdateModel.self, mutation, controller: view) { [weak self] model in
            KeychainService.standard.me = model.profileUpdate
            self?.view?.stopLoading()
            self?.view?.successFill()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
