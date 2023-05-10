//
//  OnboardingCell.swift
//  Hark
//
//  Created by mob325 on 06.01.2022.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var onboardImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(image: UIImage) {
        onboardImageView.image = image
    }
}
