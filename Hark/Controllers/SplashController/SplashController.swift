
import UIKit

class SplashController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            RootRouter.sharedInstance.loadLogin(toWindow: RootRouter.sharedInstance.window)
        }
    }
}
