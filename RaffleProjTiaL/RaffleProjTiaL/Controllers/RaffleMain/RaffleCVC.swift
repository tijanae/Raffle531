//
//  RaffleCVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleCVC: UICollectionViewCell {
    
    //MARK: UIObjects
    
    lazy var raffleTitle: UILabel = {
       let label = UILabel()
        //label.contentMode = .scaleToFill
        //label.numberOfLines = 2
        return label
    }()
    
    lazy var createdImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "calendar")
        return img
    }()
    
    lazy var createdLabel: UILabel = {
       let label = UILabel()
        //label.contentMode = .scaleToFill
        //label.numberOfLines = 2
        return label
    }()
    
    lazy var trophyImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "trophy")
        return img
    }()
    
    lazy var winnerLabel: UILabel = {
       let label = UILabel()
        //label.contentMode = .scaleToFill
        //label.numberOfLines = 2
        return label
    }()
    
    lazy var raffleStatus: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "closed")
        return img
    }()
    
    lazy var raffleStatusLabel: UILabel = {
       let label = UILabel()
        //label.contentMode = .scaleToFill
        //label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstraints()
        contentView.backgroundColor = .lightGray
    }
    
    //MARK: Private Func
    
    private func addConstraints() {
        raffleTitleConstraint()
        createdLabelConstraint()
        createdImageConstraint()
    }
    
    private func raffleTitleConstraint() {
        
        contentView.addSubview(raffleTitle)
        
        raffleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
         //raffleTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
         raffleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         raffleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    
    private func createdImageConstraint() {
        
        contentView.addSubview(createdImage)
        
        createdImage.translatesAutoresizingMaskIntoConstraints = false
        
        [createdImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
         //createdImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
         createdImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //createdImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ].forEach {$0.isActive = true}
    }
    
    private func createdLabelConstraint() {
        
        contentView.addSubview(createdLabel)
        
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [createdLabel.topAnchor.constraint(equalTo: topAnchor, constant: 33),
         //createdLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
         createdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
         createdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
