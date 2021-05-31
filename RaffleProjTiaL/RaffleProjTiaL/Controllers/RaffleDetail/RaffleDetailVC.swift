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
    
    override func loadView() {
        view = raffleDetailObject
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setUp()
        view.backgroundColor = .lightGray

        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Funcs
    
    private func loadData() {
        raffleDetailObject.raffleName.text = raffleDetails.name
    }
    
    private func setUp() {
        raffleDetailObject.cancelRaffle.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        raffleDetailObject.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        raffleDetailObject.participantsButton.addTarget(self, action: #selector(participants), for: .touchUpInside)
        raffleDetailObject.winnerButton.addTarget(self, action: #selector(winner), for: .touchUpInside)
        
    }
    
    // MARK: OBJC
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func register() {
        let register = RegisterVC()
        register.raffleDetails = raffleDetails
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
    
    @objc func participants() {
        let viewParticipants = ParticipantVC()
        viewParticipants.raffleDetails = raffleDetails
        viewParticipants.modalPresentationStyle = .fullScreen
        present(viewParticipants, animated: true, completion: nil)
    }
    
    @objc func winner() {
       let winnerView = WinnerVC()
        winnerView.modalPresentationStyle = .fullScreen
        present(winnerView, animated: true, completion: nil)
    }

    

}
