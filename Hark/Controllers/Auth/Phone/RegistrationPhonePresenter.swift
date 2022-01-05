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
protocol RegistrationPhoneOutputProtocol: BaseController {
    func successConfirmet()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol RegistrationPhonePresenterProtocol: AnyObject {
    init(view: RegistrationPhoneOutputProtocol)
    
    func loginPhone(phone: String)
}

class RegistrationPhonePresenter: RegistrationPhonePresenterProtocol {
    
    private weak var view: RegistrationPhoneOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    required init(view: RegistrationPhoneOutputProtocol) {
        self.view = view
    }
    
    func loginPhone(phone: String) {
        view?.startLoader()
        
        request?.cancel()
        
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        
        let mutation = LoginMutation(record: LoginRecordInput(authType: .accountTypeSms, udid: udid, phone: phone))
//        let query = LoginM
//        request = Network.shared.query(model: CatalogPlantsModel.self, query, controller: view) { [weak self] model in
//            self?.paginationModel = model.getCatalogPlants.pagination
//            self?.view?.stopLoading()
//            self?.view?.success(model: model)
//        } failureHandler: { [weak self] error in
//            self?.view?.stopLoading()
//            self?.view?.failure(error: error.localizedDescription)
//        }
    }
}
