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
    }
    
    //MARK: Private Func
    
    private func loadData() {
        do{
            savedRaffles = try WatchListManager.manager.getWatchList()
        } catch {
            fatalError("Could not get Watch List")
        }
        
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
        //cell.createdLabel.text = data.dateCreated
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = RaffleDetailVC()
        let selectedRaffle = savedRaffles[indexPath.row]
        //detailedVC.raffleDetails.id = selectedRaffle.id
        //detailedVC.raffleDetails = selectedRaffle
    }
 */
    
    
}
