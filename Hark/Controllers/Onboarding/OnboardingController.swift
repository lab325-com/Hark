//
//  OnboardingController.swift
//  Hark
//
//  Created by Andrey S on 06.01.2022.
//

import UIKit

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
    private let texts = ["Totally Anonymous", "Easy Search", "Express your self safe", "Express your self safe"]
    
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  cellIdentifier, for: indexPath) as! OnboardingCell
        
        return cell
    }
}

//----------------------------------------------
// MARK: - UICollectionViewDelegateFlowLayout
//----------------------------------------------

extension OnboardingController: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int((collectionView.contentOffset.x / collectionView.frame.width).rounded(.toNearestOrAwayFromZero))
        
        if let text = texts[safe: index] {
            aboutLabel.text = text
        }
        
        pageController.currentPage = index
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}
