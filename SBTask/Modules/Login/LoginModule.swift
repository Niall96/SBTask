//
//  LoginModule.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Module Builder: Responsible for building the VIPER module by using dependency injection for all external services.

import UIKit

class LoginModule {
    func build() -> UIViewController {
        let view = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as! LoginViewController
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        router.viewController = view
        interactor.presenter = presenter

        return view
    }
}
