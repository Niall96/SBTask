//
//  LoginInteractor.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Interactor: Responsible for retrieving data from the model layer, it is independent of the user interface.

import Foundation

enum LoginError: String, LocalizedError {
    case emptyEmail = "The email field cannot be empty!"
    case emptyPassword = "The password field cannot be empty!"
    
    var errorDesc: String? {
        return rawValue
    }
}

class LoginInteractor: LoginInteractorInputProtocol {

    
    weak var presenter: LoginInteractorOutputProtocol?
    
    func validateLogin(email: String, password: String) {
        guard !email.isEmpty else {
            presenter?.emptyFieldError(LoginError.emptyEmail)
            return
        }
        guard !password.isEmpty else {
            presenter?.emptyFieldError(LoginError.emptyPassword)
            return
        }
        
        presenter?.didLogin()
    }
    
}
