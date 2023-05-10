//
//  HarkListPresenter.swift
//  Hark
//
//  Created by mob325 on 20.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol HarkListOutputProtocol: BaseController {
    func success()
    func successCall(model: CallHarkModel)
    func successDelete()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol HarkListPresenterProtocol: AnyObject {
    init(view: HarkListOutputProtocol)
    
    var harksList: [HarksListModel] { get set }
    var harksRequests: [RequestsModel] { get set }
    
    func firstGetList(offset: Int)
    
    func getHarkList(offset: Int, limit: Int)
    func getRequest(offset: Int, limit: Int)
    func deleteRequest(requestId: String)
}

class HarkListPresenter: HarkListPresenterProtocol {
    
    private weak var view: HarkListOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    private var subscription: Cancellable?
    
    var harksList = [HarksListModel]()
    var harksRequests = [RequestsModel]()
    
    var paginationList: PaginationModel?
    var paginationRequest: PaginationModel?
    
    let limit = 15
    
    required init(view: HarkListOutputProtocol) {
        self.view = view
    }
    
    deinit {
        // Make sure the subscription is cancelled, if it exists, when this object is deallocated.
        self.subscription?.cancel()
      }
    
    func firstGetList(offset: Int) {
        view?.startLoader()
        
        let group = DispatchGroup()
        
        group.enter()
        let query = HarksQuery(limit: limit, offset: offset)
        
        request = Network.shared.query(model: HarksModel.self, query, controller: view) { [weak self] model in
            self?.harksList = model.harks.harks
            self?.paginationList = model.harks.pagination
            group.leave()
        } failureHandler: { error in
            group.leave()
        }
        
        group.enter()
        let query2 = HarkRequestsQuery(limit: limit, offset: offset)
        
        request = Network.shared.query(model: HarkRequestsModel.self, query2, controller: view) { [weak self] model in
            self?.harksRequests = model.harkRequests.harkRequests ?? []
            self?.paginationRequest = model.harkRequests.pagination
            group.leave()
        } failureHandler: { error in
            group.leave()
        }
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.view?.stopLoading()
            self?.view?.success()
        }
    }
    
    func getHarkList(offset: Int, limit: Int) {
        let query = HarksQuery(limit: limit, offset: offset)
        self.view?.startLoader()
        request = Network.shared.query(model: HarksModel.self, query, controller: view) { [weak self] model in
            if offset == 0 {
                self?.harksList = model.harks.harks
            } else {
                self?.harksList.append(contentsOf: model.harks.harks)
            }
            
            self?.paginationList = model.harks.pagination
            self?.view?.stopLoading()
            self?.view?.success()
        } failureHandler: { _ in
            
        }
    }
    
    func getRequest(offset: Int, limit: Int) {
        let query = HarkRequestsQuery(limit: limit, offset: offset)
        
        self.view?.startLoader()
        request = Network.shared.query(model: HarkRequestsModel.self, query, controller: view) { [weak self] model in
            if offset == 0 {
                self?.harksRequests = model.harkRequests.harkRequests ?? []
            } else {
                self?.harksRequests.append(contentsOf: model.harkRequests.harkRequests ?? [])
            }
            
            self?.paginationRequest = model.harkRequests.pagination
            self?.view?.stopLoading()
            self?.view?.success()
        } failureHandler: { _ in
            
        }
    }
    
    func subscribe() {
        self.subscription = Network.Apollo.shared.client
            .subscribe(subscription: HarksStatusSubscription()) { [weak self] result in
                guard let self = self else {
                    return
                }

                switch result {
                case .success(let graphQLResult):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: graphQLResult.data?.jsonObject ?? JSONObject(), options: .fragmentsAllowed)
                        let _ = try JSONDecoder().decode(HarksStatusModel.self, from: data)
                        self.getHarkList(offset: 0, limit: self.harksList.count == 0 ? self.limit : self.harksList.count)
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
    
    func callHark(harkId: String) {
        let mutation = CallHarkMutation(harkId: harkId)
        
        self.view?.startLoader()
        request = Network.shared.mutation(model: CallHarkModel.self, mutation, controller: view) { [weak self] model in

            self?.view?.stopLoading()
            self?.view?.successCall(model: model)
        } failureHandler: { [weak self] _ in
            self?.view?.stopLoading()
        }
    }
    
    func deleteRequest(requestId: String) {
        let mutation = DeleteHarkRequestMutation(requestId: requestId)
        
        self.view?.startLoader()
        request = Network.shared.mutation(model: DeleteHarkRequestModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.successDelete()
        } failureHandler: { [weak self] _ in
            self?.view?.stopLoading()
        }
    }
    
    func acceptRequest(requestId: String) {
        let mutation = AcceptHarkRequestMutation(requestId: requestId)
        
        self.view?.startLoader()
        request = Network.shared.mutation(model: AcceptHarkRequestModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.successDelete()
        }, failureHandler: { [weak self] _ in
            self?.view?.stopLoading()
        })
    }
    
    func regectRequest(requestId: String) {
        let mutation = RejectHarkRequestMutation(requestId: requestId)
        
        self.view?.startLoader()
        request = Network.shared.mutation(model: RejectHarkRequestModel.self, mutation, controller: view) { [weak self] model in
            self?.view?.successDelete()
        } failureHandler: { [weak self] _ in
            self?.view?.stopLoading()
        }
    }
}
 
