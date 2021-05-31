//
//  RegisterView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RegisterView: UIView {

    //MARK: UIObject
    
    var firstNameField = RaffleTextField(placeholder: "First Name")
    
    var lastNameField = RaffleTextField(placeholder: "Last Name")
    
    var emailField = RaffleTextField(placeholder: "example@mail.com")
    
    var phoneField = RaffleTextField(placeholder: "Phone Number")
        
    
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

        firstNameConstraint()
        lastNameConstraint()
        emailConstraint()
        phoneConstraint()
        submitButtonConstraint()
    }
    
    
    private func firstNameConstraint() {
        addSubview(firstNameField)
        
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        
        [firstNameField.topAnchor.constraint(equalTo: topAnchor, constant: 75 ),
         firstNameField.bottomAnchor.constraint(equalTo: topAnchor, constant: 125),
         firstNameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         firstNameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func lastNameConstraint() {
        addSubview(lastNameField)
        
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        
        [lastNameField.topAnchor.constraint(equalTo: topAnchor, constant: 150 ),
         lastNameField.bottomAnchor.constraint(equalTo: topAnchor, constant: 200),
         lastNameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         lastNameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func emailConstraint() {
        addSubview(emailField)
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        [emailField.topAnchor.constraint(equalTo: topAnchor, constant: 225 ),
         emailField.bottomAnchor.constraint(equalTo: topAnchor, constant: 275),
         emailField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         emailField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func phoneConstraint() {
        addSubview(phoneField)
        
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        
        [phoneField.topAnchor.constraint(equalTo: topAnchor, constant: 300 ),
         phoneField.bottomAnchor.constraint(equalTo: topAnchor, constant: 350),
         phoneField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         phoneField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
        
    }
    
    private func submitButtonConstraint() {
        addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        [submitButton.topAnchor.constraint(equalTo: topAnchor, constant: 400 ),
         submitButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 450),
         submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 145),
         submitButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 245)].forEach {$0.isActive = true}
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
