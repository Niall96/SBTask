//
//  PhotosProtocols.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Protocols: Define interactions between components of the VIPER module.

import Foundation

// MARK: Router
/// Navigation
protocol PhotosRouterProtocol: AnyObject {
}

// MARK: - Presenter
/// ViewController -> Presenter
protocol PhotosPresenterProtocol: AnyObject {
    var interactor: PhotosInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func getPhoto(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

// MARK: - Interactor
/// Presenter -> Interactor
protocol PhotosInteractorInputProtocol: AnyObject {
    var presenter: PhotosInteractorOutputProtocol? { get set }
    func getPhoto()
    func getPhoto(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

/// Interactor -> Presenter
protocol PhotosInteractorOutputProtocol: AnyObject {
    func didFinishLoadingPhotos(_ photos: [Photo])
    func failedLoading(_ error: Error)
}

// MARK: - View
/// Presenter -> ViewController
protocol PhotosViewProtocol: AnyObject {
    var presenter: PhotosPresenterProtocol? { get set }
    
    func didFinisihLoadingPhotos(_ photos: [Photo])
    func failedLoading(title: String, message: String)
}
