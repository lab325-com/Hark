
import Foundation

class HarkListRouter: BaseRouter {
    func presentOutgoingCall(model: HarksListModel?, delegate: OutgoingCallDelegate) {
        let controller = OutgoingCall(model: model, delegate: delegate)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
}
