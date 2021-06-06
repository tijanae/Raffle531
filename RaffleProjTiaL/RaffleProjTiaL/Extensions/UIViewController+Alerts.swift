//
//  UIViewController+Alerts.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 6/5/21.
//

import UIKit


extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
