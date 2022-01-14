//
//  MainPresentter.swift
//  Hark
//
//  Created by Andrey S on 11.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol MainOutputProtocol: BaseController {
    func success()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MainPresenterProtocol: AnyObject {
    init(view: MainOutputProtocol)
    
    func getOnlineStatistics()
}

class MainPresenter: MainPresenterProtocol {
    
    private weak var view: MainOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    required init(view: MainOutputProtocol) {
        self.view = view
    }
    
    func getOnlineStatistics() {
        view?.startLoader()
        
        request?.cancel()
        
        let query = OnlineStatisticsQuery()

        request = Network.shared.query(model: OnlineStatisticsModel.self, query, controller: view) { [weak self] model in
            PreferencesManager.sharedManager.onlineStatistics = model.onlineStatistics
            self?.view?.stopLoading()
            self?.view?.success()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
