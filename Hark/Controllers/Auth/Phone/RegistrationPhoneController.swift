//
//  PhoneController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import UIKit
import PhoneNumberKit
import AVFoundation

class RegistrationPhoneController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
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
        setCustomNavigationTitle("Registration")
    }
    
    @IBAction func actionPhonePad(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1123)
        let phone = phoneLabel.text! + "\(sender.tag)"
    
        let partialFormated = PartialFormatter().formatPartial("+\(phone)")
        
        phoneLabel.text = PartialFormatter().formatPartial(String(partialFormated.dropFirst()))
    }
    
    @IBAction func actionDelete(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1155)
        phoneLabel.text = String(phoneLabel.text!.dropLast())
    }
}
