//
//  RequestCell.swift
//  Hark
//
//  Created by Andrey S on 19.01.2022.
//

import UIKit

class RequestCell: UITableViewCell {

    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var confirmedButton: UIButton!
    
    @IBOutlet weak var receivedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confirmedButton.layer.cornerRadius = 18
        confirmedButton.layer.borderWidth = 1
        
        cornerView.layer.cornerRadius = 24
        cornerView.layer.borderWidth = 1
        cornerView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(isReceived: Bool) {
        if isReceived {
            confirmedButton.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor
            receivedLabel.isHidden = false
            confirmedButton.setImage(UIImage(named: "request_confirm_ic"), for: .normal)
            confirmedButton.setTitle(nil, for: .normal)
        } else {
            confirmedButton.layer.borderColor = UIColor(red: 0.512, green: 0.512, blue: 0.512, alpha: 1).cgColor
            receivedLabel.isHidden = true
            confirmedButton.setImage(nil, for: .normal)
            confirmedButton.setTitle("Sent", for: .normal)
        }
    }
}
