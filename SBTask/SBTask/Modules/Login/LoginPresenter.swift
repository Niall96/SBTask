//
//  LoginPresenter.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Presenter: Contains view logic for preparing content for display (as received from the Interactor) and for reacting
// to user inputs (by requesting new data from the Interactor).

import Foundation
import UIKit

class LoginPresenter: LoginPresenterProtocol {
    
    weak private var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    private let router: LoginRouterProtocol

    init(interface: LoginViewProtocol, interactor: LoginInteractorInputProtocol?, router: LoginRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    
    func didPressLoginButton() {
        interactor!.validateLogin(
            email: view?.email ?? "",
            password: view?.password ?? ""
        )
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
   
    func emptyFieldError(_ error: LoginError) {
        view?.showError(title: "Warning!", message: error.rawValue)
    }
    
    func didLogin() {
        router.navigateToPhotos()
    }
}
