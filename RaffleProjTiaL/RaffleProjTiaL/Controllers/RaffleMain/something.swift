//
//  WatchListTVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import UIKit

class WatchListTVC: UITableViewCell {

    lazy var raffleTitle: UILabel = {
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addConstraints()
    }
    
    private func addConstraints() {
        raffleTitleConstraint()
        raffleStatusConstraint()
        raffleStatusLabelConstraint()
    }
    
    private func raffleTitleConstraint() {
        
        contentView.addSubview(raffleTitle)
        
        raffleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
         //raffleTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
         raffleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
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
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
