//
//  RaffleDetailView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleDetailView: UIView {
    
    //MARK: UIObjects
    
    lazy var raffleName: UILabel = {
        let label = UILabel()
        label.text = "Win A PONY"
        label.font = UIFont(name: "GillSans-UltraBold", size: 30)
        label.textColor = .black
        return label
    }()
    
    lazy var faveRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var cancelRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var raffleSegments: UISegmentedControl = {
        let button = UISegmentedControl(items: ["Register","Participants","Winner"])
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
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addConstraints()
        addSubview(raffleSegments)
        
        
    }
    //MARK: PrivateFuncs
    
    private func addConstraints() {
        faveConstraint()
        raffleNameConstraint()
        cancelRaffleConstraint()
        
    }
    
    private func faveConstraint() {
        addSubview(faveRaffle)
        
        faveRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [faveRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 85),
         faveRaffle.bottomAnchor.constraint(equalTo: topAnchor, constant: 115),
         faveRaffle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)].forEach {$0.isActive = true}
    }
    
    private func raffleNameConstraint() {
        addSubview(raffleName)
        
        raffleName.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleName.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         raffleName.bottomAnchor.constraint(equalTo: topAnchor, constant: 150),
         raffleName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 45)].forEach {$0.isActive = true}
    }
    
    private func cancelRaffleConstraint() {
        addSubview(cancelRaffle)
        
        cancelRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 150),
         cancelRaffle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
