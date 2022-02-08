//
//  MainGoSearchController.swift
//  Hark
//
//  Created by Andrey S on 25.01.2022.
//

import UIKit

protocol MainGoSearchDelegate: AnyObject {
    func mainGoCancel(controller: MainGoSearchController)
    func mainGoSuccess(controller: MainGoSearchController)
}

class MainGoSearchController: BaseController {
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var declineButton: UIButton!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    private var timer: Timer?
    private var timeSec = 5
    weak var delegate: MainGoSearchDelegate?
    private lazy var presenter = MainPresenter(view: self)
    
    let model: StartMatchingModel
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: MainGoSearchDelegate, model: StartMatchingModel) {
        self.model = model
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
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        nickNameLabel.text = model.startMatching.user.nickName
        yearsLabel.text = "(\(model.startMatching.user.age) Years, \(model.startMatching.user.gender.matchGender))"
        declineButton.layer.cornerRadius = 6
        declineButton.layer.borderWidth = 1
        declineButton.layer.borderColor = UIColor(red: 1, green: 0.306, blue: 0.306, alpha: 1).cgColor
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let `self` = self else { return }
            self.timeSec -= 1
            if self.timeSec >= 0 {
                self.timerLabel.text = "Auto Decline in \(self.timeSec) sec"
            } else {
                self.timer?.invalidate()
                self.timer = nil
                self.presenter.declineTalks(talkId: self.model.startMatching.talkId)
            }
        }
    }
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionCancel(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        presenter.declineTalks(talkId: model.startMatching.talkId)
    }
    
    @IBAction func actionAllow(_ sender: UIButton) {
        delegate?.mainGoSuccess(controller: self)
    }
}

//----------------------------------------------
// MARK: - MainOutputProtocol
//----------------------------------------------

extension MainGoSearchController: MainOutputProtocol {
    func successDecline() {
        self.delegate?.mainGoCancel(controller: self)
        self.dismiss(animated: true)
    }
}
