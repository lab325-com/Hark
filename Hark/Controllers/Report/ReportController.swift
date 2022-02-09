
import UIKit

class ReportController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var namelabel: UIView!
    @IBOutlet weak var reportView: UIView!
    @IBOutlet weak var reportTextView: UITextView!
    @IBOutlet weak var reportPlaceholedrLabel: UILabel!
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    private let userId: String?
    
    private lazy var presenter = ReportPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(userId: String) {
        self.userId = userId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Private methods
    //----------------------------------------------
    
    private func setup() {
        reportView.layer.borderWidth = 1
        reportView.layer.borderColor = UIColor(rgb: 0xFF4E4E).cgColor
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor(rgb: 0x3CDBBE).cgColor
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionReport(_ sender: UIButton) {
        if let description = reportTextView.text, let userId = userId {
            presenter.report(userId: userId, description: description)
        }
    }
    
    @IBAction func actionCancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

//----------------------------------------------
// MARK: - CallOutputProtocol
//----------------------------------------------

extension ReportController: ReportOutputProtocol {
    func success() {
        dismiss(animated: true)
    }
    
    func failure(error: String) {
        
    }
}

//----------------------------------------------
// MARK: - UITextViewDelegate
//----------------------------------------------

extension ReportController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        reportPlaceholedrLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        reportPlaceholedrLabel.isHidden = textView.text.count > 0 ? true : false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        reportButton.isUserInteractionEnabled = textView.text.count > 0 ? true : false
        reportButton.alpha = textView.text.count > 0 ? 1.0 : 0.3
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            
            return false
        }
        
        return true
    }
}
