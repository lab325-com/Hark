//
//  AuthFillNickNameController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import UIKit

class AuthFillNickNameController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nickTextField: UITextField!
    @IBOutlet weak var addNickNameButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
   
    
    private func setup() {
        addNickNameButton.alpha = 0.3
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor(red: 0.101, green: 0.458, blue: 0.394, alpha: 1).cgColor
        
        nickTextField.becomeFirstResponder()
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionAddNickName(_ sender: UIButton) {
        if nickTextField.text!.count > 2 {
            AuthRouter(presenter: navigationController).pushAuthFillAge(nickName: nickTextField.text!)
        }
    }
    
    @IBAction func actionCancel(_ sender: UIButton) {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window)
    }
    
    @IBAction func actionValueChange(_ sender: UITextField) {
        addNickNameButton.alpha = sender.text!.count > 2 ? 1.0 : 0.3
    }
}
