//
//  AuthFillAgeController.swift
//  Hark
//
//  Created by Andrey S on 06.01.2022.
//

import UIKit

class AuthFillAgeController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var yearsLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let nickName: String
    private var datePicker = UIDatePicker()
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(nickName: String) {
        self.nickName = nickName
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
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor(red: 0.101, green: 0.458, blue: 0.394, alpha: 1).cgColor
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
           
        }
        datePicker.datePickerMode = .date
        datePicker.minuteInterval = 1
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -14, to: Date())
        datePicker.date = Calendar.current.date(byAdding: .year, value: -22, to: Date()) ?? Date()
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -140, to: Date())
        
        let screenWidth = UIScreen.main.bounds.width
        birthdayTextField.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        cancel.tintColor = UIColor.white
        
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: #selector(actionTimeDone))
        barButton.tintColor = UIColor.white
        
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        birthdayTextField.inputAccessoryView = toolBar
    }
   
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionAddAge(_ sender: UIButton) {
        AuthRouter(presenter: navigationController).pushAuthGender(nickName: nickName, age: Calendar.current.dateComponents([.year], from: datePicker.date, to: Date()).year!)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tapCancel() {
        view.endEditing(true)
    }
    
    @objc func actionTimeDone() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        birthdayTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
        yearsLabel.text = "\(Calendar.current.dateComponents([.year], from: datePicker.date, to: Date()).year!) Years"
    }
}
