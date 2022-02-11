//
//  AlertController.swift
//  SBTask
//
//  Created by Niall Rooney on 04/02/2022.
//  Copyright © 2022 The Beans Group. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String? = nil, message: String) {
        let alertViewController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        alertViewController.addAction(okAction)
        present(alertViewController, animated: true, completion: nil)
    }
}
