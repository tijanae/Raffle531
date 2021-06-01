//
//  DisplayWinnerView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import UIKit

class DisplayWinnerView: UIView {

    lazy var winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "Winner - Winner!"
        label.font = UIFont(name: "GillSans-UltraBold", size: 30)
        label.textColor = .black
        return label
    }()
    
    lazy var winnerImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "congrats")
        return img
    }()
    
    lazy var winnerName: UILabel = {
        let label = UILabel()
        label.text = "Winner Name"
        label.font = UIFont(name: "GillSans-UltraBold", size: 20)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }

    private func constraints() {
        winnerLabelConstraint()
        winnerNameConstraint()
        winnerImageConstraint()
    }
    
    private func winnerLabelConstraint() {
        addSubview(winnerLabel)
        
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [winnerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50 ),
         winnerLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         winnerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //winnerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func winnerNameConstraint() {
        addSubview(winnerName)
        
        winnerName.translatesAutoresizingMaskIntoConstraints = false
        
        [winnerName.topAnchor.constraint(equalTo: topAnchor, constant: 100 ),
         winnerName.bottomAnchor.constraint(equalTo: topAnchor, constant: 150),
         winnerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
         winnerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func winnerImageConstraint() {
        addSubview(winnerImage)
        
        winnerImage.translatesAutoresizingMaskIntoConstraints = false
        
        [winnerImage.topAnchor.constraint(equalTo: topAnchor, constant: 150 ),
         winnerImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 400),
         winnerImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         winnerImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
