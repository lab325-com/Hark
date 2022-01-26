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
    
    private let listCellIdentifier = String(describing: ListCell.self)
    private let requestCellIdentifier = String(describing: RequestCell.self)
    
    private lazy var presenter = HarkListPresenter(view: self)
    
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
        presenter.subscribe()
        //tableView.tableFooterView = UIView()
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
        
        presenter.firstGetList(offset: 0)
        
        let _ = tableView.addHeader(withTarget: self, action: #selector(self.headerRefresh(sender:)))
        
        tableView.footerBeginRefreshing()
    }
    
    //----------------------------------------------
    // MARK: - IBAction
    //----------------------------------------------
    
    @objc func headerRefresh(sender: AnyObject) {
        if selectedSegment == 0 {
            presenter.getHarkList(offset: 0, limit: presenter.limit)
        } else if selectedSegment == 1 {
            presenter.getRequest(offset: 0)
        }
    }
    
    @IBAction func actionList(_ sender: UIButton) {
        selectedSegment = 0
    }
    
    @IBAction func actionRequest(_ sender: UIButton) {
        selectedSegment = 1
    }
}

//----------------------------------------------
// MARK: - UITableViewDelegate, UITableViewDataSource
//----------------------------------------------

extension HarkListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSegment == 0 ? presenter.harksList.count : presenter.harksRequests.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if selectedSegment == 0 && presenter.paginationList?.nextPageExists == true && indexPath.row == presenter.harksList.count - 3 {
            presenter.getHarkList(offset: presenter.harksList.count, limit: presenter.limit)
        } else if selectedSegment == 1 && presenter.paginationRequest?.nextPageExists == true && indexPath.row == presenter.harksRequests.count - 3 {
            presenter.getRequest(offset: presenter.harksRequests.count)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedSegment == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.listCellIdentifier) as? ListCell else { return UITableViewCell() }
            
            if let model = presenter.harksList[safe: indexPath.row] {
                cell.config(model: model, nextIsTheSame: model.status == (presenter.harksList[safe: indexPath.row + 1]?.status ?? model.status))
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.requestCellIdentifier) as? RequestCell else { return UITableViewCell() }
            
            if let model = presenter.harksRequests[safe: indexPath.row] {
                cell.configure(model: model)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = presenter.harksList[safe: indexPath.row] {
            HarkListRouter(presenter: navigationController).presentOutgoingCall(model: model, delegate: self, token: nil, chanelID: nil, uid: nil)
        }
    }
}

//----------------------------------------------
// MARK: - Life cycle
//----------------------------------------------

extension HarkListController: HarkListOutputProtocol, OutgoingCallDelegate {
    func success() {
        tableView.headerEndRefreshing()
        tableView.reloadData()
    }
}
