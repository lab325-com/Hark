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
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    private var timer: Timer?
    private var timeSec = 3
    weak var delegate: MainGoSearchDelegate?
    private lazy var presenter = MainPresenter(view: self)
    
    let talkId: String
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(delegate: MainGoSearchDelegate, talkId: String) {
        self.talkId = talkId
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
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let `self` = self else { return }
            self.timeSec -= 1
            if self.timeSec >= 0 {
                self.timerLabel.text = "\(self.timeSec) sec"
            } else {
                self.timer?.invalidate()
                self.timer = nil
                self.delegate?.mainGoSuccess(controller: self)
            }
        }
    }
    
    //----------------------------------------------
    // MARK: - Action
    //----------------------------------------------
    
    @IBAction func actionCancel(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        presenter.declineTalks(talkId: talkId)
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
