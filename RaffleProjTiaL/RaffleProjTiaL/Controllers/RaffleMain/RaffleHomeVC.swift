//
//  RaffleHomeVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleHomeVC: UIViewController {
    
    // MARK: Data
    var raffleData = [Raffle]() {
        didSet {
            raffleView.appLabel.text = "Raffle (\(raffleData.count))"
            raffleView.raffleCollection.reloadData()
        }
    }
    
    private let raffleView = RaffleView()
    
    override func loadView() {
        loadData()
        view = raffleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setUp()
        raffleView.raffleCollection.dataSource = self
        raffleView.raffleCollection.delegate = self
        //view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        loadView()
        setGradientBackground(colorBottom: UIColor(red: 8/255, green: 92/255, blue: 0/255, alpha: 1), colorTop: .white)
    }
    
    // MARK: Private Func
    
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
        raffleApiHelper.manager.getRaffleData {[weak self] (result) in
            switch result {
            case .failure(let error):
                self?.showAlert(title: "Data Didnt load", message: error.localizedDescription)
            case .success(let data):
                self?.raffleData = data
                //self?.raffleData = data.filter{($0.raffled_at != nil)}
                
            }
        }
    }
    
    private func setUp() {
        raffleView.createRaffle.addTarget(self, action: #selector(createRaffle), for: .touchUpInside)
        raffleView.filterSegment.addTarget(self, action: #selector(filter), for: .valueChanged)
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
 
    @objc func filter(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.raffleData = self.raffleData.sorted{$0.created_at < $1.created_at}
            raffleView.raffleCollection.reloadData()
        default:
            self.raffleData = self.raffleData.sorted{$0.created_at > $1.created_at}
            raffleView.raffleCollection.reloadData()
        }
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
        
        
        let selectedRaffle = raffleData[indexPath.row]
        let detailedVC = RaffleDetailVC(raffle: selectedRaffle)
        
        detailedVC.modalPresentationStyle = .fullScreen
        present(detailedVC, animated: true, completion: nil)
    }

    
    
}
