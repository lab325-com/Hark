//
//  HarkListController.swift
//  Hark
//
//  Created by Andrey S on 19.01.2022.
//

import UIKit

class HarkListController: BaseController {

    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var topGradientView: UIView!
    
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var cornerAboveView: UIView!
    @IBOutlet weak var aboveLayoutLeading: NSLayoutConstraint!
    
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var requestButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private let topLayer = CAGradientLayer()
    private var selectedSegment = 0 {
        didSet {
            UIView.animate(withDuration: 0.3) {
                if self.selectedSegment == 0 {
                    self.aboveLayoutLeading.constant = 29
                } else {
                    self.aboveLayoutLeading.constant = 29 + self.requestButton.frame.width
                }
                self.view.layoutIfNeeded()
            }
            
            tableView.reloadData()
        }
    }
    
    let listCellIdentifier = String(describing: ListCell.self)
    let requestCellIdentifier = String(describing: RequestCell.self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topLayer.frame = topGradientView.frame
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
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: listCellIdentifier, bundle: nil), forCellReuseIdentifier: listCellIdentifier)
        tableView.register(UINib(nibName: requestCellIdentifier, bundle: nil), forCellReuseIdentifier: requestCellIdentifier)
        
        topLayer.colors = [
          UIColor(red: 0.078, green: 0.078, blue: 0.078, alpha: 1).cgColor,
          UIColor(red: 0.078, green: 0.078, blue: 0.078, alpha: 0).cgColor
        ]
        topLayer.locations = [0, 1]
        topLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        topLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        topLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.24, c: -0.24, d: 0, tx: 0.62, ty: 0.76))
        
        topGradientView.layer.addSublayer(topLayer)
        
        segmentView.layer.cornerRadius = 24
        segmentView.layer.borderWidth = 1
        segmentView.layer.borderColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1).cgColor
        
        cornerAboveView.layer.cornerRadius = 19
        cornerAboveView.layer.borderWidth = 1
        cornerAboveView.layer.borderColor = UIColor(red: 0.518, green: 0.518, blue: 0.518, alpha: 1).cgColor
        
        tableView.separatorColor = UIColor.clear
        
        tableView.reloadData()
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @IBAction func actionList(_ sender: UIButton) {
        selectedSegment = 0
    }
    
    @IBAction func actionRequest(_ sender: UIButton) {
        selectedSegment = 1
    }
}

//----------------------------------------------
// MARK: - Life cycle
//----------------------------------------------

extension HarkListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSegment == 0 ? 20 : 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            if selectedSegment == 0 {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 5))
                return view
            } else {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 15))
                return view
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedSegment == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.listCellIdentifier) as? ListCell else { return UITableViewCell() }
            
            cell.config(isOnline: indexPath.section == 0)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.requestCellIdentifier) as? RequestCell else { return UITableViewCell() }
            cell.configure(isReceived: indexPath.section == 0)
            return cell
        }
    }
}

