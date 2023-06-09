//
//  LoginPhoneController.swift
//  Hark
//
//  Created by mob325 on 05.01.2022.
//

import UIKit
import PhoneNumberKit
import AVFoundation

class LoginPhoneController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = AuthPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = false
        super.viewDidLoad()
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        confirmButton.alpha = 0.3
        setCustomNavigationTitle("Log In")
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    @IBAction func actionPhonePad(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1123)
        let phone = phoneLabel.text! + "\(sender.tag)"
    
        let partialFormated = PartialFormatter().formatPartial("+\(phone)")
        
        phoneLabel.text = PartialFormatter().formatPartial(String(partialFormated.dropFirst()))
        
        confirmButton.alpha = phoneLabel.text!.count > 7 ? 1.0 : 0.3
    }
    
    @IBAction func actionDelete(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1155)
        phoneLabel.text = String(phoneLabel.text!.dropLast())
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        if phoneLabel.text!.count > 7 {
            let result = phoneLabel.text!.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "").replacingOccurrences(of:" ", with: "", options: .regularExpression)
            let phone = "+" + result
            presenter.registePhone(phone: phone)
            AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_enter_phone)
        }
    }
}

//----------------------------------------------
// MARK: - AuthPhoneOutputProtocol
//----------------------------------------------

extension LoginPhoneController: AuthPhoneOutputProtocol {
    func successRegister(smsToken: String) {
        AuthRouter(presenter: navigationController).pushLoginVerification(phoneNumber: "+\(phoneLabel.text!)", smsToken: smsToken)
    }
}
