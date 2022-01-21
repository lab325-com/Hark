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
    var harksRequests: [HarkRequestsModel] { get set }
    
    func getList(limit: Int, offset: Int)
}

class HarkListPresenter: HarkListPresenterProtocol {
    
    private weak var view: HarkListOutputProtocol?
    private var isLoaded = false
    private var request: Cancellable?
    
    var harksList = [HarksListModel]()
    var harksRequests = [HarkRequestsModel]()
    
    required init(view: HarkListOutputProtocol) {
        self.view = view
    }
    
    func getList(limit: Int, offset: Int) {
        view?.startLoader()
        
        let query = HarksQuery(limit: limit, offset: offset)
        
        request = Network.shared.query(model: HarksModel.self, query, controller: view) { [weak self] model in
            self?.harksList = model.harks.harks
            self?.harksRequests = model.harks.harkRequests
            
            self?.view?.stopLoading()
            self?.view?.success()
        } failureHandler: { [weak self] error in
            self?.view?.stopLoading()
        }
    }
}
