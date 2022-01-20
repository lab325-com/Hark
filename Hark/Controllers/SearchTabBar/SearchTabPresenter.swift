//
//  ProfileTabPresenter.swift
//  Hark
//
//  Created by Andrey S on 18.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol SearchTabPhoneOutputProtocol: BaseController {
    func success()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol SearchTabPresenterProtocol: AnyObject {
    init(view: SearchTabPhoneOutputProtocol)
    
    func search(genders: [GenderType]?, style: Int?, mood: Int?, fromAge: Int?, toAge: Int?)
}

class SearchTabPresenter: SearchTabPresenterProtocol {
    
    private weak var view: SearchTabPhoneOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    required init(view: SearchTabPhoneOutputProtocol) {
        self.view = view
    }
    
    func search(genders: [GenderType]?, style: Int?, mood: Int?, fromAge: Int?, toAge: Int?) {
        request?.cancel()
        view?.startLoader()
        
        let mutation = UpdateMatchSettingsMutation(record: MatchSettingsUpdateInput(style: style, mood: mood, fromAge: fromAge, toAge: toAge, genders: genders))
        
        request = Network.shared.mutation(model: UpdateMatchSettingsModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            if model.updateMatchSettings {
                self?.view?.success()
            }
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
