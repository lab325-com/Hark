//
//  ListCell.swift
//  Hark
//
//  Created by mob325 on 19.01.2022.
//

import UIKit

protocol ListDelegate: AnyObject {
    func listEdit(cell: ListCell, model: HarksListModel)
}

class ListCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var statusView: UIView!
    
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bottomLayout: NSLayoutConstraint!
    
    private var model: HarksListModel?
    weak var delegate: ListDelegate?
    
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
    
    func config(model: HarksListModel, nextIsTheSame: Bool) {
        self.model = model
        
        nameLabel.text = model.nickName ?? "anonymous"
        
        if nextIsTheSame {
            bottomLayout.constant = 2
        } else {
            bottomLayout.constant = 20
        }
        layoutIfNeeded()
        
        if model.status == .userStatusTypeOffline {
            phoneImageView.isHidden = true
            statusLabel.text = "Offline"
            statusView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        } else if model.status == .userStatusTypeInCall {
            phoneImageView.isHidden = false
            statusLabel.text = "In Call"
            statusView.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor
        } else if model.status == .userStatusTypeHidden {
            phoneImageView.isHidden = false
            statusLabel.text = "Hidden"
            statusView.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor
        } else {
            phoneImageView.isHidden = false
            statusLabel.text = "Online"
            statusView.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor
        }
    }
    
    @IBAction func actionEdit(_ sender: UIButton) {
        guard let model = model else {
            return
        }

        delegate?.listEdit(cell: self, model: model)
    }
}
