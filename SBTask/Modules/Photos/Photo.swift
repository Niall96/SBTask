//
//  Photo.swift
//  SBTask
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let photoId: Int
    let photoTitle: String
    let photoURL: URL
    let thumbnailURL: String
}
