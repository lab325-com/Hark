
import Foundation
import Apollo

//----------------------------------------------
// MARK: - Outputs Protocol
//----------------------------------------------
protocol ReportOutputProtocol: BaseController {
    func success()
    
    func failure(error: String)
}

//----------------------------------------------
// MARK: - Inputs Protocol
//----------------------------------------------
protocol ReportPresenterProtocol: AnyObject {
    init(view: ReportOutputProtocol)
    
    func report(userId: String, description: String)
}

class ReportPresenter: ReportPresenterProtocol {
    
    private weak var view: ReportOutputProtocol?
    
    private var request: Cancellable?
    
    required init(view: ReportOutputProtocol) {
        self.view = view
    }
    
    func report(userId: String, description: String) {
        view?.startLoader()
        
        request?.cancel()
        
        let mutation = ReportUserMutation(userId: userId, description: description)
        
        request = Network.shared.mutation(model: ReportUserModel.self, mutation, controller: view, successHandler: { [weak self] model in
            self?.view?.stopLoading()
            if model.reportUser {
                self?.view?.success()
            }
        }, failureHandler: { [weak self] error in
            self?.view?.stopLoading()
            self?.view?.failure(error: error.localizedDescription)
        })
    }
}
