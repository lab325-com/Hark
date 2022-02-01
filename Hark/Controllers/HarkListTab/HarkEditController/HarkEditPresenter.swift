//
//  HarkEditPresenter.swift
//  Hark
//
//  Created by Andrey S on 31.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol HarkEditOutputProtocol: BaseController {
    func successDelete(hardId: String)
    func successEditName(model: HarkUpdateMainModel)
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol HarkEditPresenterProtocol: AnyObject {
    init(view: HarkEditOutputProtocol)
    
    func changeName(hardId: String, name: String)
    func delete(hardId: String)
}

class HarkEditPresenter: HarkEditPresenterProtocol {
    
    private weak var view: HarkEditOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    required init(view: HarkEditOutputProtocol) {
        self.view = view
    }
    
    func delete(hardId: String) {
        let mutation = HarkDeleteMutation(harkId: hardId)
        
        self.view?.startLoader()
        request = Network.shared.mutation(model: HarkDeleteModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successDelete(hardId: hardId)
        } failureHandler: { [weak self] _ in
            self?.view?.stopLoading()
        }
    }
    
    func changeName(hardId: String, name: String) {
        let mutation = HarkUpdateMutation(record: HarkUpdateRecordInput(harkId: hardId, nickName: name))
        
        self.view?.startLoader()
        request = Network.shared.mutation(model: HarkUpdateModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successEditName(model: model.harkUpdate)
        } failureHandler: { [weak self] _ in
            self?.view?.stopLoading()
        }
    }
}
