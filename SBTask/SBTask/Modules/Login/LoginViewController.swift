//
//  LoginViewController.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// View: Displays what the Presenter tells it to display and relays user input back to the Presenter.

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    var presenter: LoginPresenterProtocol?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    var email: String? { return emailField?.text }
    var password: String? { return passwordField?.text }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView() {
        emailField.becomeFirstResponder()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    func showError(title: String, message: String) {
        showAlert(title: title, message: message)

    }
    
    @IBAction func logInAction(_ sender: Any) {
        presenter?.didPressLoginButton()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 1.0
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 0.0
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField?.becomeFirstResponder()
        } else if textField == passwordField {
            presenter?.didPressLoginButton()
        }
        return true
    }
}
