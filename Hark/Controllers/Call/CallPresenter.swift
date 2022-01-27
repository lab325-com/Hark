//
//  CallPresenter.swift
//  Hark
//
//  Created by Andrey S on 27.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol CallOutputProtocol: BaseController {
    func endCall()
    func successDecline()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol CallPresenterProtocol: AnyObject {
    init(view: CallOutputProtocol)
    
    func declineTalks(talkId: String)
    
    func subscribeTalkId(talkId: String)
    func unsubscirbeTallk()
}

class CallPresenter: CallPresenterProtocol {
    
    private weak var view: CallOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    private var talkSubscription: Cancellable?
    
    required init(view: CallOutputProtocol) {
        self.view = view
    }
    
    deinit {
        talkSubscription?.cancel()
        talkSubscription = nil
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
                        self.view?.endCall()
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
}
