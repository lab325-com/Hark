//
//  ListCell.swift
//  Hark
//
//  Created by Andrey S on 19.01.2022.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cornerView.layer.cornerRadius = 24
        cornerView.layer.borderWidth = 1
        cornerView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
        statusView.layer.cornerRadius = 19
        statusView.layer.borderWidth = 1
        statusView.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(isOnline: Bool) {
        if isOnline {
            phoneImageView.isHidden = false
            statusLabel.text = "Online"
            statusView.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor
        } else {
            phoneImageView.isHidden = true
            statusLabel.text = "Offline"
            statusView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        }
    }
}
