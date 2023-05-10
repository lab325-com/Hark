
import UIKit

class HarkListRouter: BaseRouter {
    func presentCall(model: HarksListModel?, delegate: CallControllerDelegate, callModel: CallProtocol, callType: CallType) {
        let controller = CallController(name: model?.nickName, delegate: delegate, model: callModel, callType: callType)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
    
    func presentEdit(tabBarController: UITabBarController?, name: String, harkId: String, delegate: HarkEditDelegate) {
        let controller = HarkEditController(name: name, harkId: harkId, delegate: delegate)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        tabBarController?.present(controller, animated: true, completion: nil)
    }
}
