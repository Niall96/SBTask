//
//  PhotosViewController.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//
// View: Displays what the Presenter tells it to display and relays user input back to the Presenter.

import UIKit

enum PhotosError: String, LocalizedError {
    case unknown
    
    var errorDescription: String? {
        return rawValue
    }
}

class PhotosViewController: UIViewController, PhotosViewProtocol, UITableViewDataSource, UITableViewDelegate {
    
    var presenter: PhotosPresenterProtocol?
    
    @IBOutlet weak var photoTableView: UITableView!
    
    private var photos: [Photo]?
    
    override func viewDidLoad() {
        navigationController?.navigationBar.tintColor = .black
        setTableView()
        presenter?.viewDidLoad()
    }
    
    func setTableView() {
        photoTableView.delegate = self
        photoTableView.dataSource = self
    }
    
    func didFinisihLoadingPhotos(_ photos: [Photo]) {
        self.photos = photos
        photoTableView.reloadData()
    }
    
    func failedLoading(title: String, message: String) {
        showAlert(title: title, message: message)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = photoTableView.dequeueReusableCell(withIdentifier: "PhotoCell" , for: indexPath) as! PhotoTableViewCell
        let photo = photos?[indexPath.row]
        cell.initCell(photo: photo)
        return cell
    }
}
