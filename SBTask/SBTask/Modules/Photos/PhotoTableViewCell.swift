//
//  PhotoTableViewCell.swift
//  SBTask
//
//  Created by Niall Rooney on 04/02/2022.
//  Copyright © 2022 The Beans Group. All rights reserved.
//

import Foundation
import UIKit

class PhotoTableViewCell: UITableViewCell {
    var presenter: PhotosPresenterProtocol?
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var photoView: UIImageView?
    @IBOutlet var spinner: UIActivityIndicatorView?
    
    func initCell(photo: Photo?) {
        titleLabel?.text = photo?.photoTitle
        photoView?.image = nil
        spinner?.startAnimating()
        presenter?.getPhoto(from: photo!.photoURL, completion: {
            switch $0 {
            case .success(let data):
                self.spinner?.stopAnimating()
                self.photoView?.image = UIImage(data: data)
            case .failure(let error):
                self.photoView?.image = nil
                print(error.localizedDescription)
            }
        })
    }
}
