//
//  PhotosPresenter.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Presenter: Contains view logic for preparing content for display (as received from the Interactor) and for reacting
// to user inputs (by requesting new data from the Interactor).

import Foundation

class PhotosPresenter: PhotosPresenterProtocol {
    
    weak private var view: PhotosViewProtocol?
    var interactor: PhotosInteractorInputProtocol?
    private let router: PhotosRouterProtocol

    init(interface: PhotosViewProtocol, interactor: PhotosInteractorInputProtocol?, router: PhotosRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor?.getPhoto()
    }
    
    func getPhoto(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        interactor?.getPhoto(from: url, completion: completion)
    }
}

extension PhotosPresenter: PhotosInteractorOutputProtocol {
    func failedLoading(_ error: Error) {
        view?.failedLoading(title: "Waring", message: "Photo Failed To Load")
    }
    
    func didFinishLoadingPhotos(_ photos: [Photo]) {
        view?.didFinisihLoadingPhotos(photos)
    }
}
