//
//  ProfileTabPresenter.swift
//  Hark
//
//  Created by mob325 on 18.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol SearchTabPhoneOutputProtocol: BaseController {
    func success()
    func successMathSettings(model: MatchSettingsMainModel)
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol SearchTabPresenterProtocol: AnyObject {
    init(view: SearchTabPhoneOutputProtocol)
    
    func getMatch()
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
        
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_search_settings, values: ["search_from_age" : fromAge ?? 18, "search_to_age" : toAge ?? 110, "search_gender" : genders ?? [], "search_mood" : mood ?? [], "search_style" : style ?? 50])
        
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
    
    func getMatch() {
        view?.startLoader()
        
        let query = MatchSettingsQuery()
        
        request = Network.shared.query(model: MatchSettingsModel.self, query, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successMathSettings(model: model.matchSettings)
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
