//
//  LoginController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import UIKit

class LoginController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var registrationButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = AuthPresenter(view: self)
    
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
        registrationButton.layer.cornerRadius = 6
        registrationButton.layer.borderWidth = 1
        registrationButton.layer.borderColor = UIColor.white.cgColor
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionClose(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushRegistrationPhone()
    }
    
    @IBAction func actionRegistration(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushRegistrationPhone()
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushLoginPhone()
    }
}

//----------------------------------------------
// MARK: - AuthPhoneOutputProtocol
//----------------------------------------------

extension LoginController: AuthPhoneOutputProtocol {
    func successGuest(authToken: String) {
        AuthRouter(presenter: navigationController).pushAuthFillNickName()
    }
    
    func successGoToRoot() {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window)
    }
}
