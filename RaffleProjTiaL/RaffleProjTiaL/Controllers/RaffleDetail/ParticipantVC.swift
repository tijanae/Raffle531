//
//  ParticipantVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class ParticipantVC: UIViewController {
    
    //MARK: DATA
    var participants = [Participants]() {
        didSet {
            participantView.participantTV.reloadData()
        }
    }
    var raffleDetails: AllRaffles!
    
    private let participantView = ParticipantView()
    
    override func loadView() {
        view = participantView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        participantView.participantTV.dataSource = self
        participantView.participantTV.delegate = self
        loadData()
        setUp()
        view.backgroundColor = .darkGray

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
            self.participantView.raffleName.text = self.raffleDetails.name
        }
        /*
        guard let pathToJSON = Bundle.main.path(forResource: "Participants", ofType: "json") else {
            fatalError("Unexpected Error: cannot find JSON")}
        
        let url = URL(fileURLWithPath: pathToJSON)
        do {
            let data = try Data(contentsOf: url)
            self.participants = try Participants.getAllParticipants(from: data)
        } catch {
            print(error)
            fatalError("Unexpected Error in Participant home")
        }
 */
    }
    

    private func setUp() {
        participantView.cancelView.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
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
        cell.nameLabel.text = data.firstname
        cell.emailLabel.text = data.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
