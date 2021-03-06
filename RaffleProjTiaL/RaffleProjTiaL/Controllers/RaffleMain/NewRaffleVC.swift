//
//  NewRaffleVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class NewRaffleVC: UIViewController {
    
    //MARK: Data
    
    private let newRaffleView = NewRaffleView()
    
    override func loadView() {
        view = newRaffleView
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadView()
        setGradientBackground(colorBottom: UIColor(red: 8/255, green: 92/255, blue: 0/255, alpha: 1), colorTop: .white)
    }
    
    private func setGradientBackground(colorBottom: UIColor, colorTop: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
       self.view.layer.insertSublayer(gradientLayer, at: 0)
      }
    
    
    
    private func setUp() {
        newRaffleView.cancelRaffle.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        newRaffleView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        newRaffleView.textSecureButton.addTarget(self, action: #selector(viewPassword), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func submit() {
        guard let newRaffle = createProjectFromFields() else {displayInvalidProjectAlert()
            return
        }
        raffleApiHelper.manager.postRaffle(newRaffle) { [weak self] result in
            switch result {
            case .success:
                print("yay it worked")
            case .failure:
                fatalError("error posting new raffle")
                
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func viewPassword() {
        if newRaffleView.secrectTokenTF.isSecureTextEntry == true {
            newRaffleView.secrectTokenTF.isSecureTextEntry = false
            newRaffleView.textSecureButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            newRaffleView.secrectTokenTF.isSecureTextEntry = true
            newRaffleView.textSecureButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    
    }
    
    private func createProjectFromFields() -> Raffle? {
        guard let raffleName = newRaffleView.RaffleNameTF.text else {
                return nil
        }
        guard let secretToken = newRaffleView.secrectTokenTF.text else{fatalError("Must enter token")}
        return Raffle(name: raffleName, secret_token: secretToken)
    }
    
    private func displayPostFailureAlert(with error: Error) {
        displayAlert(title: "Error posting new Project", message: error.localizedDescription)
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
