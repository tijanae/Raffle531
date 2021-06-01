//
//  participantTVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class participantTVC: UITableViewCell {
    
    
    lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "person")
        return img
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "GillSans-UltraBold", size: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var idImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "id")
        return img
    }()
    
    lazy var idLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "GillSans-UltraBold", size: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var emailImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "mail")
        return img
    }()
    
    lazy var emailLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "GillSans-UltraBold", size: 15)
        label.textColor = .black
        return label
    }()
    
    lazy var phoneImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "phone")
        return img
    }()
    
    lazy var phoneLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "GillSans-UltraBold", size: 15)
        label.textColor = .black
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
    
    //MARK: Private Func
    
    private func addConstraints(){
        userImageConstraint()
        nameLabelConstraint()
        idImageConstraint()
        idLabelConstraint()
        emailImageConstraint()
        emailLabelConstraint()
        //phoneImageConstraint()
        //phoneLabelConstraint()
    }
    
    private func userImageConstraint() {
        
        contentView.addSubview(userImage)
        
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        [userImage.topAnchor.constraint(equalTo: topAnchor, constant: 30),
         //userImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         userImage.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 50)
        ].forEach {$0.isActive = true}
    }
    
    private func nameLabelConstraint() {
        
        contentView.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30),
         //nameLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 50),
         nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func idImageConstraint() {
        
        contentView.addSubview(idImage)
        
        idImage.translatesAutoresizingMaskIntoConstraints = false
        
        [idImage.topAnchor.constraint(equalTo: topAnchor, constant: 60),
         //idImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 105),
         idImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         idImage.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 50)
        ].forEach {$0.isActive = true}
    }
    
    private func idLabelConstraint() {
        
        contentView.addSubview(idLabel)
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
         //idLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func emailImageConstraint() {
        
        contentView.addSubview(emailImage)
        
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        
        [emailImage.topAnchor.constraint(equalTo: topAnchor, constant: 90),
         //emailImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 135),
         emailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         emailImage.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 50)
        ].forEach {$0.isActive = true}
    }
    
    private func emailLabelConstraint() {
        
        contentView.addSubview(emailLabel)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [emailLabel.topAnchor.constraint(equalTo: topAnchor, constant: 90),
         //emailLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 135),
         emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
         emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    /*
    private func phoneImageConstraint() {
        
        contentView.addSubview(phoneImage)
        
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        
        [phoneImage.topAnchor.constraint(equalTo: topAnchor, constant: 140),
         phoneImage.bottomAnchor.constraint(equalTo: topAnchor, constant: 165),
         phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         phoneImage.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 50)
        ].forEach {$0.isActive = true}
    }
    
    private func phoneLabelConstraint() {
        
        contentView.addSubview(phoneLabel)
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [phoneLabel.topAnchor.constraint(equalTo: topAnchor, constant: 140),
         phoneLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 165),
         phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
         phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    */
    
    

}
