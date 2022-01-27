
import Foundation

class HarkListRouter: BaseRouter {
    func presentCall(model: HarksListModel?, delegate: CallControllerDelegate, callModel: CallProtocol) {
        let controller = CallController(name: model?.nickName, delegate: delegate, model: callModel)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
}
