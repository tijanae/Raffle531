//
//  RegisterView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RegisterView: UIView {

    //MARK: UIObject
    
    lazy var raffleTitle: UILabel = {
       let label = UILabel()
        label.text = "RAFFLE NAME"
        label.textColor = .black
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var firstNameField: UITextField = {
        let text = UITextField()
        text.text = " First Name"
        text.backgroundColor = .black
        text.borderStyle = .line
//        text.font = UIFont(name: "Damascus", size: 10)
        text.textColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
    lazy var lastNameField: UITextField = {
        let text = UITextField()
        text.text = " Last Name"
        text.backgroundColor = .black
        text.borderStyle = .line
//        text.font = UIFont(name: "Damascus", size: 10)
        text.textColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
    lazy var emailField: UITextField = {
        let text = UITextField()
        text.text = " example@mail.com"
        text.backgroundColor = .black
        text.borderStyle = .line
//        text.font = UIFont(name: "Damascus", size: 10)
        text.textColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
    lazy var phoneField: UITextField = {
        let text = UITextField()
        text.text = " Phone"
        text.backgroundColor = .black
        text.borderStyle = .line
//        text.font = UIFont(name: "Damascus", size: 10)
        text.textColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Submit", for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addConstraints()
        
    }
    
    //MARK: Private Func
    
    private func addConstraints() {
        raffleTitleConstraint()
        firstNameConstraint()
        lastNameConstraint()
        emailConstraint()
        phoneConstraint()
        submitButtonConstraint()
        cancelButtonConstraint()
    }
    
    private func raffleTitleConstraint() {
        addSubview(raffleTitle)
        
        raffleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 50 ),
         raffleTitle.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         raffleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //raffleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func firstNameConstraint() {
        addSubview(firstNameField)
        
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        
        [firstNameField.topAnchor.constraint(equalTo: topAnchor, constant: 200 ),
         firstNameField.bottomAnchor.constraint(equalTo: topAnchor, constant: 250),
         firstNameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         firstNameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func lastNameConstraint() {
        addSubview(lastNameField)
        
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        
        [lastNameField.topAnchor.constraint(equalTo: topAnchor, constant: 275 ),
         lastNameField.bottomAnchor.constraint(equalTo: topAnchor, constant: 325),
         lastNameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         lastNameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func emailConstraint() {
        addSubview(emailField)
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        [emailField.topAnchor.constraint(equalTo: topAnchor, constant: 350 ),
         emailField.bottomAnchor.constraint(equalTo: topAnchor, constant: 400),
         emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func phoneConstraint() {
        addSubview(phoneField)
        
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        
        [phoneField.topAnchor.constraint(equalTo: topAnchor, constant: 425 ),
         phoneField.bottomAnchor.constraint(equalTo: topAnchor, constant: 475),
         phoneField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         phoneField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
        
    }
    
    private func submitButtonConstraint() {
        addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        [submitButton.topAnchor.constraint(equalTo: topAnchor, constant: 550 ),
         submitButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 600),
         submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
         submitButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 275)].forEach {$0.isActive = true}
        
    }
    
    private func cancelButtonConstraint() {
        addSubview(cancelButton)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 150 ),
         cancelButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 175),
         cancelButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
         cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
