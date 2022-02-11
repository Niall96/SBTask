//
//  PhotosInteractor.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// Interactor: Responsible for retrieving data from the model layer, it is independent of the user interface.

import Foundation

class PhotosInteractor: PhotosInteractorInputProtocol {
 
    weak var presenter: PhotosInteractorOutputProtocol?
    

    private struct photo {
        static let albumUrl = URL(string: "https://jsonplaceholder.typicode.com/photos")
    }
    
    
    func getPhotoData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let urlSession = URLSession(configuration: URLSessionConfiguration.default,
                                    delegate: nil,
                                    delegateQueue: nil)
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
            
        }
        dataTask.resume()
    }
    
    func getPhoto() {
        getPhotoData(from: photo.albumUrl!) { [weak self] netResult in
            switch netResult {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([Photo].self, from: data)
                    self?.presenter?.didFinishLoadingPhotos(response)
                } catch {
                    self?.presenter?.failedLoading(error)
                }
            case .failure(let error):
                self?.presenter?.failedLoading(error)
            }
        }
    }
    
    func getPhoto(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        getPhotoData(from: photo.albumUrl!) { [weak self] netResult in
            switch netResult {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode([Photo].self, from: data)
                    self?.presenter?.didFinishLoadingPhotos(response)
                } catch {
                    self?.presenter?.failedLoading(error)
                }
            case .failure(let error):
                self?.presenter?.failedLoading(error)
            }
        }
    }
}
