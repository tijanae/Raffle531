//
//  WatchListVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WatchListVC: UIViewController {
    
    //MARK: Data
    
    var savedRaffles = [WatchListPersisted]()
    private let watchView = WatchListView()
    
    override func loadView() {
        view = watchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Func
    
    private func loadData() {
        do{ savedRaffles = try WatchListManager.manager.getWatchList()
        } catch {
            fatalError("Could not get Watch List")
        }
        
        
    }

}
