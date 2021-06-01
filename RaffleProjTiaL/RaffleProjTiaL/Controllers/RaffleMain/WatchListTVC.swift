//
//  WatchListTVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import UIKit

class WatchTVC: UITableViewCell {

    lazy var raffleTitle: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "GillSans-UltraBold", size: 15)
        return label
    }()
    
    lazy var raffleStatus: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "calendar")
        return img
    }()
    
    lazy var raffleStatusLabel: UILabel = {
       let label = UILabel()

        return label
    }()
    
    lazy var deleteRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        constraints()
        // Configure the view for the selected state
    }
    
    private func constraints(){
        raffleTitleConstraint()
        raffleStatusConstraint()
        raffleStatusLabelConstraint()
        deleteConstraint()
    }

    private func raffleTitleConstraint() {
        
        contentView.addSubview(raffleTitle)
        
        raffleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
         //raffleTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
         raffleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         raffleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    
    private func deleteConstraint() {
        
        contentView.addSubview(deleteRaffle)
        
        deleteRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [deleteRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
         //deleteRaffle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
         deleteRaffle.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
         raffleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
    
    private func raffleStatusConstraint() {
        
        contentView.addSubview(raffleStatus)
        
        raffleStatus.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleStatus.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         //raffleStatus.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
         raffleStatus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //raffleStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100)
        ].forEach {$0.isActive = true}
    }
    
    private func raffleStatusLabelConstraint() {
        
        contentView.addSubview(raffleStatusLabel)
        
        raffleStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 55),
         //raffleStatusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
         raffleStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45),
         raffleStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
    }
}
