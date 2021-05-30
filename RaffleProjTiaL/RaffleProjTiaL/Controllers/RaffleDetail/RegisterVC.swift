//
//  RegisterVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RegisterVC: UIViewController {
    
    private let registerView = RegisterView()
    
    override func loadView() {
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        view.backgroundColor = .lightGray

        // Do any additional setup after loading the view.
    }
    
    private func setUp() {
        registerView.submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        registerView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
    }
    
    @objc func submit() {
        print("YAY youre registered")
        dismiss(animated: true, completion: nil)
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

}
