//
//  LoginVerificationController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import UIKit
import AVFoundation

class LoginVerificationController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet var numbersLabel: [UILabel]!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let phoneNumber: String
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
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
        if let label = numbersLabel.last(where: {$0.text?.count != 0}) {
            label.text = ""
            let _ = checkButton()
        }
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        if checkButton() {
            
        }
    }
    
}
