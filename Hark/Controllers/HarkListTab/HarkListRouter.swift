
import Foundation

class HarkListRouter: BaseRouter {
    func presentOutgoingCall(model: HarksListModel?, delegate: OutgoingCallDelegate, token: String?, chanelID: String?, uid: UInt?) {
        let controller = OutgoingCall(model: model, delegate: delegate, token: token, chanelID: chanelID, uid: uid)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
}
