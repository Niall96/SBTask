//
//  PhotosModule.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Module Builder: Responsible for building the VIPER module by using dependency injection for all external services.

import UIKit

class PhotosModule {
    func build() -> UIViewController {
        let view = UIStoryboard(name: "Photos", bundle: nil).instantiateInitialViewController() as! PhotosViewController
        let router = PhotosRouter()
        let interactor = PhotosInteractor()
        let presenter = PhotosPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        router.viewController = view
        interactor.presenter = presenter

        return view
    }
}
