//
//  RaffleView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleView: UIView {
    
    //MARK: UIOBJECTS

    lazy var appLabel: UILabel = {
        let label = UILabel()
        label.text = "Summer Raffles"
        label.font = UIFont(name: "GillSans-UltraBold", size: 30)
        label.textColor = .black
        return label
    }()
    
    lazy var createRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var filterSegment: UISegmentedControl = {
        let button = UISegmentedControl(items: ["Newer","Older"])
        let xPostion:CGFloat = 10
        let yPostion:CGFloat = 150
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
                
        button.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        button.selectedSegmentIndex = 1
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.lightGray
        return button
    }()
    
    lazy var raffleCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        //layout.scrollDirection = .horizontal
        let raffleCV = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        raffleCV.backgroundColor = .white
        raffleCV.register(RaffleCVC.self, forCellWithReuseIdentifier: "RaffleCVC")

        return raffleCV
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addConstraints()
        addSubview(filterSegment)
    }
    
    //MARK: Private Func
    
    private func addConstraints() {
        appLabelConstraint()
        createRaffleConstraint()
        raffleCollectionConstraint()
    }
    
    
    private func appLabelConstraint() {
        addSubview(appLabel)
        
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [appLabel.topAnchor.constraint(equalTo: topAnchor, constant: 75 ),
         //appLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
         appLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ].forEach {$0.isActive = true}
    }
    
    private func createRaffleConstraint() {
        addSubview(createRaffle)
        
        createRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [createRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 155),
         //createRaffle.bottomAnchor.constraint(equalTo: topAnchor, constant: 50),
         //createRaffle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
         createRaffle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }
    
    private func raffleCollectionConstraint() {
        addSubview(raffleCollection)
        
        raffleCollection.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleCollection.topAnchor.constraint(equalTo: topAnchor, constant: 200),
         raffleCollection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
         raffleCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
         raffleCollection.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach {$0.isActive = true}
        
        raffleCollection.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
