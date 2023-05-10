//
//  MainPresentter.swift
//  Hark
//
//  Created by mob325 on 11.01.2022.
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
    
    func getCall(model: UserModel)
}

extension MainOutputProtocol {
    func success() {}
    func successDecline() {}
    func successStartMath(model: StartMatchingModel) {}
    func successTalkID() {}
    
    func getCall(model: UserModel) {}
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
    
    func subscribeTalkId(talkId: String)
    func unsubscirbeTallk()
    
    func subscribeCallUser()
    func unsubscribeSubscribeCallUser()
}

class MainPresenter: MainPresenterProtocol {
    
    private weak var view: MainOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    private var startMath: Cancellable?
    private var talkSubscription: Cancellable?
    private var userSubscribe: Cancellable?
    
    required init(view: MainOutputProtocol) {
        self.view = view
    }
    
    deinit {
        startMath?.cancel()
        startMath = nil
        
        talkSubscription?.cancel()
        talkSubscription = nil
        
        userSubscribe?.cancel()
        userSubscribe = nil
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
                        
                        self.unsubscirbeTallk()
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
    
    func unsubscirbeTallk() {
        talkSubscription?.cancel()
        talkSubscription = nil
    }
    
    func subscribeCallUser() {
        let sub = UserSubscription()
        self.userSubscribe = Network.Apollo.shared.client
            .subscribe(subscription: sub) { [weak self] result in
                guard let self = self else {
                    return
                }
                
                switch result {
                case .success(let graphQLResult):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: graphQLResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                        let model = try JSONDecoder().decode(UserModel.self, from: data)
                        
                        self.view?.getCall(model: model)
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
    
    func unsubscribeSubscribeCallUser() {
        userSubscribe?.cancel()
        userSubscribe = nil
    }
}
