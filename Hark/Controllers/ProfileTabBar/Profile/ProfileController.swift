//
//  PofileController.swift
//  Hark
//
//  Created by Andrey S on 12.01.2022.
//

import UIKit

class ProfileController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nickTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    @IBOutlet weak var onlineStatus: UISwitch!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = ProfilePresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        setupBackButton = false
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        update()
        
        setCustomNavigationTitle("Your Profile")
        let backButton = UIBarButtonItem(image: UIImage(named: "profile_settings_ic"), style: .plain, target: self, action: #selector(actionSettings))
        navigationItem.rightBarButtonItem = backButton
    }
    
    private func gendeType() -> GenderType {
        switch segmentControll.selectedSegmentIndex {
        case 1:
            return .genderTypeWoman
        case 2:
            return .genderTypeCommon
        default:
            return .genderTypeMan
        }
    }
    
    private func update() {
        if let nick = KeychainService.standard.me?.nickName {
            nickTextField.text = nick
        }
        
        if let age = KeychainService.standard.me?.age {
            ageTextField.text = String(age)
        }
        
        if let gender = KeychainService.standard.me?.gender {
            switch gender {
            case .genderTypeCommon:
                segmentControll.selectedSegmentIndex = 2
            case .genderTypeMan:
                segmentControll.selectedSegmentIndex = 0
            case .genderTypeWoman:
                segmentControll.selectedSegmentIndex = 1
            case .__unknown(_):
                break
            }
        }
        
        onlineStatus.isOn = KeychainService.standard.me?.isAnonymous ?? false
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @objc func actionSettings() {
        ProfileRouter(presenter: navigationController).presentMenu()
    }
    
    override func hideKeyboard() {
        super.hideKeyboard()
        presenter.updateProfile(age: Int(ageTextField.text!), gender: gendeType(), nickName: nickTextField.text, hideStatus: onlineStatus.isOn)
    }
    
    @IBAction func changeOnlineStatus(_ sender: UISwitch) {
        presenter.updateProfile(age: Int(ageTextField.text!), gender: gendeType(), nickName: nickTextField.text, hideStatus: onlineStatus.isOn)
    }
    
    @IBAction func actionChangeSegment(_ sender: UISegmentedControl) {
        presenter.updateProfile(age: Int(ageTextField.text!), gender: gendeType(), nickName: nickTextField.text, hideStatus: onlineStatus.isOn)
    }
}

//----------------------------------------------
// MARK: - ProfilePhoneOutputProtocol
//----------------------------------------------

extension ProfileController: ProfilePhoneOutputProtocol {
    func success() {
        update()
    }
}
