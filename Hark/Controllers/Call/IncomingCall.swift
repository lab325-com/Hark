
import UIKit

class IncomingCall: UIViewController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //----------------------------------------------
    // MARK: - Private methods
    //----------------------------------------------
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionAcceptCall(_ sender: UIButton) {
        
    }
    
    @IBAction func actionDeclineCall(_ sender: UIButton) {
        dismiss(animated: false)
    }
}
