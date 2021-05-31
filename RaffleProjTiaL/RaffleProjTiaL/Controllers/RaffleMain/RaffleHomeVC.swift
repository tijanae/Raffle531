//
//  RaffleHomeVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleHomeVC: UIViewController {
    
    // MARK: Data
    var raffleData = [AllRaffles]() {
        didSet {
            raffleView.raffleCollection.reloadData()
        }
    }
    
    private let raffleView = RaffleView()
    
    override func loadView() {
        view = raffleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setUp()
        raffleView.raffleCollection.dataSource = self
        raffleView.raffleCollection.delegate = self
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    // MARK: Private Func
    
    
    private func loadData() {
        raffleApiHelper.manager.getRaffleData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.raffleData = data
                self.raffleData = self.raffleData.sorted{$0.created_at > $1.created_at}
            }
        }
        
        
    }
    
    private func setUp() {
        raffleView.createRaffle.addTarget(self, action: #selector(createRaffle), for: .touchUpInside)
    }
    
    private func sortRaffle() {
        raffleData = raffleData.sorted{$0.created_at < $1.created_at}
        raffleView.raffleCollection.reloadData()
    }
 
    
    @objc func createRaffle() {
        let newRaffle = NewRaffleVC()
        newRaffle.modalPresentationStyle = .fullScreen
        present(newRaffle, animated: true, completion: nil)
    }
 
    

    

}

extension RaffleHomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return raffleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let raffleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RaffleCVC", for: indexPath) as? RaffleCVC else{return UICollectionViewCell()}
        let data = raffleData[indexPath.row]
        
        raffleCell.raffleTitle.text = data.name
        raffleCell.createdImage.image = UIImage(named: "calendar")
        raffleCell.createdLabel.text = data.dateCreated
        //raffleCell.raffleStatus.image = UIImage(named: "closed")
        raffleCell.raffleStatusLabel.text = data.dateRaffled
        raffleCell.winnerLabel.text = "convert to user"
        
        if data.dateRaffled == "This Raffle has not closed yet." {
            raffleCell.raffleStatus.image = UIImage(named: "open")
        } else {
            raffleCell.raffleStatus.image = UIImage(named: "closed")
        }
     
        return raffleCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 150)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailedVC = RaffleDetailVC()
        let selectedRaffle = raffleData[indexPath.row]
        
        detailedVC.raffleDetails = selectedRaffle
        
        detailedVC.modalPresentationStyle = .fullScreen
        present(detailedVC, animated: true, completion: nil)
    }

    
    
}
