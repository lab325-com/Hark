//
//  LoginPhoneController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
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
            AuthRouter(presenter: navigationController).pushLoginVerification(phoneNumber: "+\(phoneLabel.text!)")
        }
    }
}
