//
//  OnboardingController.swift
//  Hark
//
//  Created by mob325 on 06.01.2022.
//

import UIKit

struct OnboardingModel {
    let text: String
    let image: UIImage
}

class OnboardingController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var aboutLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let cellIdentifier = String(describing: OnboardingCell.self)
    private let models = [OnboardingModel(text: "Setup your profile", image: UIImage(named: "onboarding_1_ic")!),
                          OnboardingModel(text: "Select your Style", image: UIImage(named: "onboarding_2_ic")!),
                          OnboardingModel(text: "Select a type of person you like to talk", image: UIImage(named: "onboarding_3_ic")!),
                          OnboardingModel(text: "Feel free to talk about anything", image: UIImage(named: "onboarding_4_ic")!)]
    
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
        collectionView.register(UINib.init(nibName: cellIdentifier,
                                           bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.reloadData()
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionSkip(_ sender: UIButton) {
        RootRouter.sharedInstance.loadLogin(toWindow: RootRouter.sharedInstance.window)
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
//----------------------------------------------

extension OnboardingController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! OnboardingCell
        if let model = models[safe: indexPath.row] {
            cell.configureCell(image: model.image)
        }
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension OnboardingController: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int((collectionView.contentOffset.x / collectionView.frame.width).rounded(.toNearestOrAwayFromZero))
        
        if let model = models[safe: index] {
            aboutLabel.text = model.text
        }
        
        pageController.currentPage = index
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
