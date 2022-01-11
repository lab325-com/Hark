//
//  RegistrationVerificationController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import UIKit
import AVFoundation

class RegistrationVerificationController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet var numbersLabel: [UILabel]!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet var numbersViews: [UIView]!
    @IBOutlet weak var wrongView: UIView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let phoneNumber: String
    private var smsToken: String
    
    private lazy var presenter = AuthPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(phoneNumber: String, smsToken: String) {
        self.phoneNumber = phoneNumber
        self.smsToken = smsToken
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
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        wrongView.isHidden = true
        phoneLabel.text = phoneNumber
        setCustomNavigationTitle("Verification")
        confirmButton.alpha = 0.3
        confirmButton.isEnabled = false
    }
    
    private func checkButton() -> Bool {
        if let _ = numbersLabel.first(where: {$0.text?.count == 0}) {
            confirmButton.alpha = 0.3
            confirmButton.isEnabled = false
            return false
        } else {
            confirmButton.alpha = 1.0
            confirmButton.isEnabled = true
            return true
        }
    }
    
    private func isWrongCode(_ value: Bool) {
        wrongView.isHidden = !value
        
        for view in numbersViews {
            view.layer.borderWidth = value ? 1 : 0
            view.layer.borderColor = value ? UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor : UIColor.clear.cgColor
        }
        
        for label in numbersLabel {
            label.textColor = value ? UIColor(red: 1, green: 0, blue: 0, alpha: 1) : UIColor.black
        }
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionPhonePad(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1123)
        if let label = numbersLabel.first(where: {$0.text?.count == 0}) {
            label.text = "\(sender.tag)"
            let _ = checkButton()
        }
    }
    
    
    @IBAction func actionDelete(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1155)
        isWrongCode(false)
        if let label = numbersLabel.last(where: {$0.text?.count != 0}) {
            label.text = ""
            let _ = checkButton()
        }
    }
    
    @IBAction func actionResend(_ sender: UIButton) {
        let result = phoneLabel.text!.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
        presenter.registePhone(phone: result.replacingOccurrences( of:" ", with: "", options: .regularExpression))
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        if checkButton(), let code = Int(numbersLabel.compactMap({$0.text!}).joined(separator: "")) {
            presenter.validate(smsToken: smsToken, code: code)
        }
    }
    
}

//----------------------------------------------
// MARK: - AuthPhoneOutputProtocol
//----------------------------------------------

extension RegistrationVerificationController: AuthPhoneOutputProtocol {
    func successRegister(smsToken: String) {
        self.smsToken = smsToken
    }
    
    func successValidata() {
        AuthRouter(presenter: navigationController).pushAuthFillNickName()
    }
    
    func successGoToRoot() {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window)
    }
    
    func failureValidate() {
        isWrongCode(true)
    }
}
