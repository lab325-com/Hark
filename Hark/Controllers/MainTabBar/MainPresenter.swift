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
    
    func successStartMath(model: StartMatchingModel)
    func successDecline()
    func successTalkID()
}

extension MainOutputProtocol {
    func success() {}
    func successDecline() {}
    func successStartMath(model: StartMatchingModel) {}
    func successTalkID() {}
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol MainPresenterProtocol: AnyObject {
    init(view: MainOutputProtocol)
    
    func getOnlineStatistics()
    func declineTalks(talkId: String)
    
    func subscribeStartMath()
    func unsubscribeStartMath()
    
}

class MainPresenter: MainPresenterProtocol {
    
    private weak var view: MainOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    private var startMath: Cancellable?
    private var talkSubscription: Cancellable?
    
    required init(view: MainOutputProtocol) {
        self.view = view
    }
    
    deinit {
        startMath?.cancel()
        startMath = nil
        
        talkSubscription?.cancel()
        talkSubscription = nil
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
    
    func declineTalks(talkId: String) {
        view?.startLoader()
        
        request?.cancel()
        
        let query = DeclineTalkQuery(talkId: talkId)

        request = Network.shared.query(model: DeclineTalkModel.self, query, controller: view) { [weak self] model in
            self?.view?.stopLoading()
            self?.view?.successDecline()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.successDecline()
        }
    }
    
    
    //----------------------------------------------
    // MARK: - Subscription
    //----------------------------------------------

    func subscribeStartMath() {
        self.startMath = Network.Apollo.shared.client
            .subscribe(subscription: StartMatchingSubscription()) { [weak self] result in
                guard let self = self else {
                    return
                }

                switch result {
                case .success(let graphQLResult):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: graphQLResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                        let model = try JSONDecoder().decode(StartMatchingModel.self, from: data)
                        self.unsubscribeStartMath()
                        self.view?.successStartMath(model: model)
                    } catch {
                        debugPrint("Failure! Error: \(error)")
                    }
                case .failure(let error):
                    debugPrint(error)
                    break
                    // Not included here: Show some kind of alert
                }
            }
    }
    
    func unsubscribeStartMath() {
        startMath?.cancel()
        startMath = nil
    }
    
    
    func subscribeTalkId(talkId: String) {
        
        let sub = TalkSubscription(talkId: talkId)
        self.talkSubscription = Network.Apollo.shared.client
            .subscribe(subscription: sub) { [weak self] result in
                guard let self = self else {
                    return
                }
                
                switch result {
                case .success(let graphQLResult):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: graphQLResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                        let _ = try JSONDecoder().decode(TalkSubscriptionModel.self, from: data)
                        
                        self.talkSubscription?.cancel()
                        self.talkSubscription = nil
                        self.view?.successTalkID()
                    } catch {
                        debugPrint("Failure! Error: \(error)")
                    }
                case .failure(let error):
                    debugPrint(error)
                    break
                    // Not included here: Show some kind of alert
                }
            }
    }
}
