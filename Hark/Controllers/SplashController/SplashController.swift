
import UIKit

class SplashController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let _ = KeychainService.standard.newAuthToken, let _ = KeychainService.standard.me {
                RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window)
            } else {
                RootRouter.sharedInstance.loadOnboarding(toWindow: RootRouter.sharedInstance.window)
            }
        }
    }
}
