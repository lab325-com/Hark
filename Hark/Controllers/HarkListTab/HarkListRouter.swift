
import Foundation

class HarkListRouter: BaseRouter {
    func presentCall(model: HarksListModel?, delegate: CallControllerDelegate, token: String?, chanelID: String?, uid: UInt?) {
        let controller = CallController(model: model, delegate: delegate, token: token, chanelID: chanelID, uid: uid)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
}
