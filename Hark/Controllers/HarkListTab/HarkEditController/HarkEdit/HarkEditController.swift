//
//  HarkEditController.swift
//  Hark
//
//  Created by Andrey S on 31.01.2022.
//

import UIKit

protocol HarkEditDelegate: AnyObject {
    func harkEdit(controller: HarkEditController, deleteHarkId: String)
    func harkEdit(controller: HarkEditController, changeNameModel: HarkUpdateMainModel)
}

class HarkEditController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var textSubView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var changeNameButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let name: String
    private let harkId: String
    weak var delegate: HarkEditDelegate?
    private lazy var presenter = HarkEditPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(name: String, harkId: String, delegate: HarkEditDelegate) {
        self.name = name
        self.harkId = harkId
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        addTapOnScreen = false
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        nameTextField.text = name
        checkName()
        
        nameTextField.becomeFirstResponder()
        
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mainView.layer.cornerRadius = 24
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
        textSubView.layer.cornerRadius = 24
        textSubView.layer.borderWidth = 1
        textSubView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
        cancelButton.layer.cornerRadius = 6
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor(red: 0.094, green: 0.09, blue: 0.18, alpha: 1).cgColor
    }
    
    @discardableResult
    private func checkName() -> Bool {
        changeNameButton.alpha = nameTextField.text!.count > 0 ? 1.0 : 0.7
        return nameTextField.text!.count > 0 ? true : false
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionEditChange(_ sender: UITextField) {
        checkName()
    }
    
    @IBAction func actionChangeName(_ sender: UIButton) {
        if checkName() {
            presenter.changeName(hardId: harkId, name: nameTextField.text!)
        }
    }
    
    @IBAction func actionDelete(_ sender: UIButton) {
        presenter.delete(hardId: harkId)
    }
    
    @IBAction func actionCancel(_ sender: UIButton) {
        hideKeyboard()
        dismiss(animated: true)
    }
}

//----------------------------------------------
// MARK: - HarkEditOutputProtocol
//----------------------------------------------

extension HarkEditController: HarkEditOutputProtocol {
    func successDelete(hardId: String) {
        delegate?.harkEdit(controller: self, deleteHarkId: harkId)
    }
    
    func successEditName(model: HarkUpdateMainModel) {
        delegate?.harkEdit(controller: self, changeNameModel: model)
    }
}
