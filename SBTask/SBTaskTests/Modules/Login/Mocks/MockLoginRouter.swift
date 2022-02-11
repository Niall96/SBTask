//
//  MockLoginRouter.swift
//  SBTaskTests
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//

@testable import SBTask

class MockLoginRouter: LoginRouterProtocol {
    var navigateToPhotosCalled = false
    
    func navigateToPhotos() {
        navigateToPhotosCalled = true
    }
}
