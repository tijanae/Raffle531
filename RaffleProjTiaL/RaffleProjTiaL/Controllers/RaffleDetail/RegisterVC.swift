//
//  RegisterVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RegisterVC: UIViewController {
    
    private let registerView = RegisterView()
    
    var raffleDetails: AllRaffles!
    
    override func loadView() {
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view.backgroundColor = .darkGray

        // Do any additional setup after loading the view.
    }
    
    private func setUp() {
        registerView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        
    }
    
    @objc func submit() {
        guard let newParticipant = createParticipantFromFields() else { displayInvalidProjectAlert()
            return
        }
        
        raffleApiHelper.manager.postParticipants(object: String(raffleDetails.id), newParticipant) { [weak self] result in
            switch result {
            case .failure:
                print("error registering participant ")
            case .success:
                print("hello new participant")
            }
        }
        
        print("YAY youre registered")
        //dismiss(animated: true, completion: nil)
    }

    
    private func createParticipantFromFields() -> ParticipantWrapper? {
        guard let participantFirstName = registerView.firstNameField.text else {
            fatalError("Must enter first name")
        }
        guard let participantLastName = registerView.lastNameField.text else {
            fatalError("Must enter last name")
        }
        guard let participantEmail = registerView.emailField.text else {
            fatalError("Must enter email")
        }
        guard let participantPhone = registerView.phoneField.text else {
            fatalError("Must enter email")
        }
        return ParticipantWrapper(firstname: participantFirstName, lastname: participantLastName, email: participantEmail, phone: participantPhone)
        
    }
    
    private func displayInvalidProjectAlert() {
        displayAlert(title: "Invalid Post", message: "Ensure you have completed fields")
    }
    
    private func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

}
