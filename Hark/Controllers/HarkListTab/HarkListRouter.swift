
import Foundation

class HarkListRouter: BaseRouter {
    func presentOutgoingCall(model: HarksListModel) {
        let controller = OutgoingCall(model: model)
        present(controller: controller, animated: false, presentStyle: .overFullScreen)
    }
}
