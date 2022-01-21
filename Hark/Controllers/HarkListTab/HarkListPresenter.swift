//
//  HarkListPresenter.swift
//  Hark
//
//  Created by Andrey S on 20.01.2022.
//

import Foundation
import Apollo
import UIKit

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol HarkListOutputProtocol: BaseController {
    func success()
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol HarkListPresenterProtocol: AnyObject {
    init(view: HarkListOutputProtocol)
    
    var harksList: [HarksListModel] { get set }
    var harksRequests: [RequestsModel] { get set }
    
    func firstGetList(offset: Int)
    
    func getHarkList(offset: Int)
    func getRequest(offset: Int)
}

class HarkListPresenter: HarkListPresenterProtocol {
    
    private weak var view: HarkListOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    var harksList = [HarksListModel]()
    var harksRequests = [RequestsModel]()
    
    var paginationList: PaginationModel?
    var paginationRequest: PaginationModel?
    
    let limit = 15
    
    required init(view: HarkListOutputProtocol) {
        self.view = view
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
    
    func getHarkList(offset: Int) {
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
    
    func getRequest(offset: Int) {
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
}
