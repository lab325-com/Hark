
import Foundation

class HarkListRouter: BaseRouter {
    func presentCall(model: HarksListModel?, delegate: CallControllerDelegate, callModel: CallProtocol, callType: CallType) {
        let controller = CallController(name: model?.nickName, delegate: delegate, model: callModel, callType: callType)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
}
