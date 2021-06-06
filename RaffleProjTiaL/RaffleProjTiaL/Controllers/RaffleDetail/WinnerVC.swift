//
//  WinnerVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WinnerVC: UIViewController {
    
    private let winnerView = WinnerView()
    private let displayWinnerView = DisplayWinnerView()
    
    //MARK: Data
    var raffleDetails: Raffle!
    var winner = [Winner]()
    
    override func loadView() {
        loadData()
        guard raffleDetails.dateRaffled == "This Raffle has not closed yet." else {return view = displayWinnerView}
        view = winnerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setUp()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Func
    
    private func loadData() {
        raffleApiHelper.manager.getWinner(object: String(raffleDetails.id)) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                print("we've got a winner! \(data)")
                self.winner = [data]
                self.displayWinnerView.winnerName.text = "\(self.winner[0].firstname) \(self.winner[0].lastname)"
            }
        }
        //displayWinnerView.winnerName.text = "\(winner[0].firstname) \(winner[0].lastname)"
    }
    
    private func setUp() {
        winnerView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
    }
    
    
    @objc func submit() {
        guard let token = createTokenFromTF() else {fatalError("error choosing winner")  }
        
        raffleApiHelper.manager.setWinner(object: String(raffleDetails.id), token) { result in
            switch result {
            case .failure:
                print("error getting winner")
            case .success:
                print("hello winner")
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func createTokenFromTF() -> WinnerWrapper? {
        guard let tokenTF = winnerView.tokenField.text else {
            fatalError("Must enter Token")
        }
        return WinnerWrapper(secret_token: tokenTF)
    }
    

}
