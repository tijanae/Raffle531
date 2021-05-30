//
//  WinnerVC.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WinnerVC: UIViewController {
    
    private let winnerView = WinnerView()
    
    override func loadView() {
        view = winnerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUp()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Private Func
    
    private func setUp() {
        winnerView.cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

}
