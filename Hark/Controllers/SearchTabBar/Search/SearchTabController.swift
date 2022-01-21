//
//  SearchTabController.swift
//  Hark
//
//  Created by Andrey S on 18.01.2022.
//

import UIKit

class SearchTabController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var lowerAgeControll: UIImageView!
    @IBOutlet weak var loweLayoutLeding: NSLayoutConstraint!
    @IBOutlet weak var lowAgeLabel: UILabel!
    
    @IBOutlet weak var upperImageView: UIImageView!
    @IBOutlet weak var upperTrailingLayout: NSLayoutConstraint!
    @IBOutlet weak var upperAgeLabel: UILabel!
    
    @IBOutlet weak var yourStyleView: UIView!
    @IBOutlet weak var styleImageView: UIImageView!
    @IBOutlet weak var yourStyleLayoutLeding: NSLayoutConstraint!
    
    @IBOutlet weak var yourMoodView: UIView!
    @IBOutlet weak var moodImageView: UIImageView!
    @IBOutlet weak var yourMoodLayoutLeding: NSLayoutConstraint!
    
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var commonButton: UIButton!

    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private var startingConstant: CGFloat = 22.0
    private var endedConstant: CGFloat = 22.0
    
    private var startingStyleConstant: CGFloat = (UIScreen.main.bounds.size.width - 44) / 2
    private var startingMoodConstant: CGFloat = (UIScreen.main.bounds.size.width - 44) / 2
    
    private let diffPointStyle = 99 / (UIScreen.main.bounds.width - 66)
    private let diffReversePointStyle = (UIScreen.main.bounds.width - 66) / 99
    
    private let startAge = 18
    private let endAge = 110
    
    private let diffPoint = 92 / (UIScreen.main.bounds.width - 66)
    private let diffAgePoint = (UIScreen.main.bounds.width - 66) / 92
    
    private let offset: CGFloat = 22
    
    private var layerStyle = CAGradientLayer()
    private var layerMoodStyle = CAGradientLayer()
    
    private lazy var presenter = SearchTabPresenter(view: self)
    
    private var selectedGenders = Set<GenderType>() {
        didSet {
            updateGendersButton()
        }
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layerStyle.bounds = yourStyleView.bounds.insetBy(dx: -0.5*yourStyleView.bounds.size.width, dy: -0.5*yourStyleView.bounds.size.height)
        layerStyle.position = view.center
        
        layerMoodStyle.bounds = yourMoodView.bounds.insetBy(dx: -0.5*yourMoodView.bounds.size.width, dy: -0.5*yourMoodView.bounds.size.height)
        layerMoodStyle.position = view.center
        
    }
    
    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        let panRecognizer = UIPanGestureRecognizer(target:self, action:#selector(detectPan))
        
        lowerAgeControll.isUserInteractionEnabled = true
        lowerAgeControll.addGestureRecognizer(panRecognizer)
        
        let panRecognizerUpper = UIPanGestureRecognizer(target:self, action:#selector(detectPanUpper))
        
        upperImageView.isUserInteractionEnabled = true
        upperImageView.addGestureRecognizer(panRecognizerUpper)
        
        let panRecognizerStyle = UIPanGestureRecognizer(target:self, action:#selector(detectPanStyle))
        
        styleImageView.isUserInteractionEnabled = true
        styleImageView.addGestureRecognizer(panRecognizerStyle)
        
        let panRecognizerMood = UIPanGestureRecognizer(target:self, action:#selector(detectPanMood))
        
        moodImageView.isUserInteractionEnabled = true
        moodImageView.addGestureRecognizer(panRecognizerMood)
        
        layerStyle.colors = [
          UIColor(red: 0.271, green: 1, blue: 0.651, alpha: 1).cgColor,
          UIColor(red: 0.211, green: 0.472, blue: 0.779, alpha: 1).cgColor
        ]
        layerStyle.locations = [0, 1]
        layerStyle.startPoint = CGPoint(x: 0.25, y: 0.5)
        layerStyle.endPoint = CGPoint(x: 0.75, y: 0.5)
        layerStyle.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.99, b: 0, c: 0, d: 698.92, tx: 0.01, ty: -348.96))
        
        yourStyleView.layer.addSublayer(layerStyle)
        
        yourStyleLayoutLeding.constant = startingStyleConstant
        
        layerMoodStyle.colors = [
          UIColor(red: 0.271, green: 1, blue: 0.651, alpha: 1).cgColor,
          UIColor(red: 0.211, green: 0.472, blue: 0.779, alpha: 1).cgColor
        ]
        layerMoodStyle.locations = [0, 1]
        layerMoodStyle.startPoint = CGPoint(x: 0.25, y: 0.5)
        layerMoodStyle.endPoint = CGPoint(x: 0.75, y: 0.5)
        layerMoodStyle.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0.99, b: 0, c: 0, d: 698.92, tx: 0.01, ty: -348.96))
        
        yourMoodView.layer.addSublayer(layerMoodStyle)
        
        yourMoodLayoutLeding.constant = startingMoodConstant
        
        presenter.getMatch()
    }
    
    private func updateGendersButton() {
        maleButton.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
        femaleButton.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
        commonButton.setTitleColor(UIColor(rgb: 0x191919), for: .normal)
        
        for type in selectedGenders {
            switch type {
            case .genderTypeMan:
                maleButton.setTitleColor(UIColor.white, for: .normal)
            case .genderTypeWoman:
                femaleButton.setTitleColor(UIColor.white, for: .normal)
            case .genderTypeCommon:
                commonButton.setTitleColor(UIColor.white, for: .normal)
            default:
                break
            }
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionGender(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if selectedGenders.contains(.genderTypeMan) {
                selectedGenders.remove(.genderTypeMan)
            } else {
                selectedGenders.insert(.genderTypeMan)
            }
        case 1:
            if selectedGenders.contains(.genderTypeWoman) {
                selectedGenders.remove(.genderTypeWoman)
            } else {
                selectedGenders.insert(.genderTypeWoman)
            }
        case 2:
            if selectedGenders.contains(.genderTypeCommon) {
                selectedGenders.remove(.genderTypeCommon)
            } else {
                selectedGenders.insert(.genderTypeCommon)
            }
        default:
            break
        }
        
        sendReuquest()
    }
    
    private func sendReuquest() {
        let style = Int(CGFloat(1) + (yourStyleLayoutLeding.constant - offset) * diffPointStyle)
        let mood = Int(CGFloat(1) + (yourMoodLayoutLeding.constant - offset) * diffPointStyle)
        let fromAge = Int(CGFloat(startAge) + (loweLayoutLeding.constant - offset) * diffPoint)
        let toAge = Int(CGFloat(endAge) - (upperTrailingLayout.constant - offset) * diffPoint)
        
        presenter.search(genders: Array(selectedGenders), style: style, mood: mood, fromAge: fromAge, toAge: toAge)
    }
    
    //----------------------------------------------
    // MARK: - Gesture
    //----------------------------------------------
    
    @objc func detectPan(_ sender:UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view)
            
            if (startingConstant + translation.x) + 60 >= UIScreen.main.bounds.width - endedConstant  {
                return
            } else if startingConstant + translation.x < offset {
                loweLayoutLeding.constant = offset
                startingConstant = offset
                return
            } else if startingConstant + translation.x > UIScreen.main.bounds.width - offset * 2 {
                loweLayoutLeding.constant = UIScreen.main.bounds.width - offset * 2
                startingConstant = UIScreen.main.bounds.width - offset * 2
                return
            }
            
            loweLayoutLeding.constant = startingConstant + translation.x
        }
        
        if sender.state == .ended {
            startingConstant = loweLayoutLeding.constant
            
            sendReuquest()
        }
        
        lowAgeLabel.text = "\(Int(CGFloat(startAge) + (loweLayoutLeding.constant - offset) * diffPoint))"
    }
    
    @objc func detectPanUpper(_ sender:UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view)
            
            if (endedConstant - translation.x) + 60 >= UIScreen.main.bounds.width - startingConstant {
                return
            } else if endedConstant - translation.x < offset {
                upperTrailingLayout.constant = offset
                endedConstant = offset
                return
            } else if endedConstant - translation.x > UIScreen.main.bounds.width - offset * 2 {
                upperTrailingLayout.constant = UIScreen.main.bounds.width - offset * 2
                endedConstant = UIScreen.main.bounds.width - offset * 2
                return
            }
            
            upperTrailingLayout.constant = endedConstant - translation.x
        }
        
        if sender.state == .ended {
            endedConstant = upperTrailingLayout.constant
            
            sendReuquest()
        }
        
        upperAgeLabel.text = "\(Int(CGFloat(endAge) - (upperTrailingLayout.constant - offset) * diffPoint))"
    }
    
    @objc func detectPanStyle(_ sender:UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view)
            
            if startingStyleConstant + translation.x < offset {
                yourStyleLayoutLeding.constant = offset
                startingStyleConstant = offset
                return
            } else if startingStyleConstant + translation.x > UIScreen.main.bounds.width - offset * 2 {
                yourStyleLayoutLeding.constant = UIScreen.main.bounds.width - offset * 2
                startingStyleConstant = UIScreen.main.bounds.width - offset * 2
                return
            }
            
            yourStyleLayoutLeding.constant = startingStyleConstant + translation.x
        }
        
        if sender.state == .ended {
            startingStyleConstant = yourStyleLayoutLeding.constant
            
            sendReuquest()
        }
    }
    
    @objc func detectPanMood(_ sender:UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view)
            
            if startingMoodConstant + translation.x < offset {
                yourMoodLayoutLeding.constant = offset
                startingMoodConstant = offset
                return
            } else if startingMoodConstant + translation.x > UIScreen.main.bounds.width - offset * 2 {
                yourMoodLayoutLeding.constant = UIScreen.main.bounds.width - offset * 2
                startingMoodConstant = UIScreen.main.bounds.width - offset * 2
                return
            }
            
            yourMoodLayoutLeding.constant = startingMoodConstant + translation.x
        }
        
        if sender.state == .ended {
            startingMoodConstant = yourMoodLayoutLeding.constant
            
            sendReuquest()
        }
    }
}

//----------------------------------------------
// MARK: - SearchTabPhoneOutputProtocol
//----------------------------------------------

extension SearchTabController: SearchTabPhoneOutputProtocol {
    func success() {
        
    }
    
    func successMathSettings(model: MatchSettingsMainModel) {
        if let fromAge = model.fromAge {
            lowAgeLabel.text = String(fromAge)
            
            let delta = CGFloat(fromAge - 18) * diffAgePoint + offset
            startingConstant = delta
            loweLayoutLeding.constant = delta
        }
        
        if let toAge = model.toAge {
            upperAgeLabel.text = String(toAge)
            
            let delta = CGFloat(110 - toAge) * diffAgePoint + offset
            endedConstant = delta
            upperTrailingLayout.constant = delta
        }
        
        if let mood = model.mood {
            let delta = CGFloat(mood - 1) * diffReversePointStyle + offset
            startingMoodConstant = delta
            yourMoodLayoutLeding.constant = delta
        }
        
        if let style = model.style {
            let delta = CGFloat(style - 1) * diffReversePointStyle + offset
            startingStyleConstant = delta
            yourStyleLayoutLeding.constant = delta
        }
        
        selectedGenders = Set(model.genders ?? [])
    }
}
