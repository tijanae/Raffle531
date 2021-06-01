//
//  RaffleDetailVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleDetailVC: UIViewController {
    
    var raffleDetails: AllRaffles!
    var raffleDetailObject = RaffleDetailView()
    
    var childVC = UIViewController()
    
    private let participantChild = ParticipantVC()
    
    /*
    private let registerChild = RegisterVC()
    private let participantChild = ParticipantVC()
    private let winnerChild = WinnerVC()
    */
    
    override func loadView() {
        view = raffleDetailObject
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setUp()
        addChildVC()
        view.backgroundColor = .systemIndigo
        //view.backgroundColor = UIColor(red: 8/255, green: 92/255, blue: 0/255, alpha: 10)
       
        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Funcs
    
    private func addChildVC() {
        addChild(childVC)
        view.addSubview(childVC.view)
        //childVC.raffleDetails = raffleDetails
        childVC.didMove(toParent: self)
        setChildConstraints()
    }
    
    private func setChildConstraints() {
        
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        [childVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
         childVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         childVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
         childVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    
    private func loadData() {
        raffleDetailObject.raffleName.text = raffleDetails.name
    }
    
    private func setUp() {
        raffleDetailObject.cancelRaffle.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        raffleDetailObject.raffleSegments.addTarget(self, action: #selector(newView), for: .valueChanged)
        raffleDetailObject.faveRaffle.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    // MARK: OBJC
    
    @objc func save() {
        let raffle = WatchListPersisted(id: raffleDetails.id, name: raffleDetails.name, created_at: raffleDetails.created_at)
        DispatchQueue.global(qos: .utility).async {
            try? WatchListManager.manager.saveWatchList(watchlistData: raffle)
        }
        raffleDetailObject.faveRaffle.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func newView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            let viewParticipants = ParticipantVC()
            childVC = viewParticipants
            viewParticipants.raffleDetails = raffleDetails
            viewDidLoad()

        case 2:
            let winnerView = WinnerVC()
            childVC = winnerView
            winnerView.raffleDetails = raffleDetails
            viewDidLoad()
            
        default:
            let register = RegisterVC()
            childVC = register
            register.raffleDetails = raffleDetails
            viewDidLoad()
        }
    }
    


}
