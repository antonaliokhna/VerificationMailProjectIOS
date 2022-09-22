//
//  CustomAlert.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/22/22.
//

import Foundation
import UIKit

class CustomAlertController {

    static func showAlert(vc: UIViewController, title: String, message: String, customActions: [UIAlertAction]? = nil) {
        let alert = CustomAlertController.createDetaultAlert(title: title, message: message)
        if let actions = customActions {
            actions.forEach { alert.addAction($0) }
        }
        vc.present(alert, animated: true)
    }
    

    private static func createDetaultAlert(title: String, message: String) -> UIAlertController {
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))

        return alert
    }
}
