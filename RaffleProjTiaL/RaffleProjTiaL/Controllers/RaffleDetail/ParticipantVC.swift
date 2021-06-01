//
//  ParticipantVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class ParticipantVC: UIViewController {
    
    private let participantView = ParticipantView()
    private let noParticipantView = noParticipantsView()
    
    //MARK: DATA
    var participants = [Participants]() {
        didSet {
            participantView.participantTV.reloadData()
        }
    }
    var raffleDetails: AllRaffles!

    
    override func loadView() {
        loadData()
        guard participants.count == 0 else {return view = noParticipantView}
        view = participantView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        participantView.participantTV.dataSource = self
        participantView.participantTV.delegate = self
        loadData()
        view.backgroundColor = .darkGray
        print(raffleDetails.id)

        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        raffleApiHelper.manager.getParticipants(object: String(raffleDetails.id)) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.participants = data
            }
            
    }
        if raffleDetails.dateRaffled != "This Raffle has not closed yet."{
            participantView.participantLabel.text = "This Raffle Has CLOSED!"
        }
    
    }
}

extension ParticipantVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = participants[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "participantTable", for: indexPath) as? participantTVC else{return UITableViewCell()}
        cell.idLabel.text = String(data.id)
        cell.nameLabel.text = "\(data.firstname) \(data.lastname)"
        cell.emailLabel.text = data.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
