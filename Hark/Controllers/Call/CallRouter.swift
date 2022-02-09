
import UIKit

class CallRouter: BaseRouter {
    
    func presentReport(userId: String) {
        let controller = ReportController(userId: userId)
        present(controller: controller, animated: true)
    }
}
