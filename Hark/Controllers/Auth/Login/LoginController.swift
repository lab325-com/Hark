//
//  LoginController.swift
//  Hark
//
//  Created by Andrey S on 05.01.2022.
//

import UIKit

class LoginController: UIViewController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var guestView: UIView!
    
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
        registerView.layer.cornerRadius = 6
        registerView.layer.borderWidth = 1
        registerView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        
        guestView.layer.cornerRadius = 6
        guestView.layer.borderWidth = 1
        guestView.layer.borderColor = UIColor(red: 0.467, green: 0.467, blue: 0.467, alpha: 1).cgColor
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionRegistration(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushRegistrationPhone()
    }
    
    @IBAction func actionGuestMode(_ sender: UIButton) {
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushLoginPhone()

    }
}
