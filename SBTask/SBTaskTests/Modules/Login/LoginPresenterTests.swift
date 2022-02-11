//
//  LoginPresenterTests.swift
//  SBTaskTests
//
//  Created by Julien Claverie on 05/11/2019.
//  Copyright © 2019 The Beans Group. All rights reserved.
//

@testable import SBTask
import XCTest

class LoginPresenterTests: XCTestCase {
    var presenter: LoginPresenter!
    var router: MockLoginRouter!

    override func setUp() {
        router = MockLoginRouter()
        presenter = LoginPresenter(interface: LoginViewController(), interactor: nil, router: router)
    }

    func test_OnLoginButtonPress_NavigateToPhotos() {
        presenter.didPressLoginButton()
        
        XCTAssertTrue(router.navigateToPhotosCalled)
    }
}
