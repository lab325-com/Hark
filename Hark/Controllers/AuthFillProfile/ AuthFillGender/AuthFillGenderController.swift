//
//  AuthFillGenderController.swift
//  Hark
//
//  Created by mob325 on 06.01.2022.
//

import UIKit

class AuthFillGenderController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let nickName: String
    private let age: Int
    private lazy var presenter = AuthFillPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(nickName: String, age: Int) {
        self.nickName = nickName
        self.age = age
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor(red: 0.101, green: 0.458, blue: 0.394, alpha: 1).cgColor
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionFinish(_ sender: UIButton) {
        var genderType: GenderType = .genderTypeMan
        
        switch genderSegment.selectedSegmentIndex{
        case 0:
            genderType = .genderTypeMan
        case 1:
            genderType = .genderTypeWoman
        case 2:
            genderType = .genderTypeCommon
        default:
            return
        }
        presenter.fillProfile(age: age, gender: genderType, nickName: nickName)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
 
//----------------------------------------------
// MARK: - AuthFillOutputProtocol
//----------------------------------------------

extension AuthFillGenderController: AuthFillOutputProtocol {
    func successFill() {
        RootRouter.sharedInstance.loadMain(toWindow: RootRouter.sharedInstance.window!)
    }
}
