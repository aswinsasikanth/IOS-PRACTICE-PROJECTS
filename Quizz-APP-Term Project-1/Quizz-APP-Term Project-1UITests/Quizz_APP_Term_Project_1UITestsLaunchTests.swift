//
//  Quizz_APP_Term_Project_1UITestsLaunchTests.swift
//  Quizz-APP-Term Project-1UITests
//
//  Created by Aswin Sasikanth Kanduri on 2022-10-25.
//

import XCTest

final class Quizz_APP_Term_Project_1UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
