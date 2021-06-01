//
//  WatchListVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WatchListVC: UIViewController {
    
    private let watchView = WatchListView()
    private let noWatchView = noSavedWatchListView()
    //MARK: Data
    
    var savedRaffles = [WatchListPersisted]() {
        didSet {
            watchView.watchTV.reloadData()
        }
    }
    //var pushRaffleDetails = AllRaffles!
    
    override func loadView() {
        loadData()
        guard savedRaffles.count != 0 else {return view = noWatchView}
        view = watchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        watchView.watchTV.dataSource = self
        watchView.watchTV.delegate = self
        view.backgroundColor = .darkGray

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadView()
        setGradientBackground(colorBottom: UIColor(red: 8/255, green: 92/255, blue: 0/255, alpha: 1), colorTop: .white)
    }
    
    //MARK: Private Func
    private func setGradientBackground(colorBottom: UIColor, colorTop: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
       self.view.layer.insertSublayer(gradientLayer, at: 0)
      }
    
    private func loadData() {
        do{
            savedRaffles = try WatchListManager.manager.getWatchList()
        } catch {
            fatalError("Could not get Watch List")
        }
    }
    
    @objc func deleteRaffle(sender: UIButton){
        try? WatchListManager.manager.deleteWatchList(watchList: self.savedRaffles, atIndex: sender.tag)
        viewWillAppear(true)
    }
    
    
}

extension WatchListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedRaffles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = savedRaffles[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "watchListTable", for: indexPath) as? WatchTVC else {return UITableViewCell()}
        
        cell.raffleTitle.text = data.name
        cell.raffleStatusLabel.text = data.dateCreated
        //cell.createdLabel.text = data.dateCreated
        cell.deleteRaffle.tag = indexPath.row
        cell.deleteRaffle.addTarget(self, action: #selector(deleteRaffle), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = RaffleDetailVC()
        let selectedRaffle = savedRaffles[indexPath.row]
        
        detailedVC.raffleDetails.id = selectedRaffle.id
        //detailedVC.raffleDetails = selectedRaffle
    }
 */
 
    
    
}
