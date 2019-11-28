//
//  FlawlessValidationTests.swift
//  FlawlessValidationTests
//
//  Created by OMELCHUK Daniil on 28/11/2019.
//  Copyright © 2019 OMELCHUK Daniil. All rights reserved.
//

import XCTest
@testable import FlawlessValidation

class FlawlessValidationTests: XCTestCase {
    
    var flawlessValidation: FlawlessValidation!

    override func setUp() {
        flawlessValidation = FlawlessValidation()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInnValidation() {
        XCTAssertTrue(flawlessValidation.innValidation(innString: "6449013711"), "10-ти значный ИНН Не Валиден")
        XCTAssertFalse(flawlessValidation.innValidation(innString: "6449013701"), "10-ти значный ИНН Валиден")
        XCTAssertTrue(flawlessValidation.innValidation(innString: "780204893183"), "12-ти значный ИНН Не Валиден")
        XCTAssertFalse(flawlessValidation.innValidation(innString: "780205893183"), "12-ти значный ИНН Валиден")
    }
    
    func testPhoneFormmating() {
        XCTAssertEqual(flawlessValidation.toPhoneNumber(phoneNumber: "89030001300"), "+7 (903) 000-13-00")
        XCTAssertEqual(flawlessValidation.toPhoneNumber(phoneNumber: "7903firj()00013(00"), "+7 (903) 000-13-00")
    }
    
    func testAccountFormating() {
        XCTAssertEqual(flawlessValidation.toAccountFormat(accountNumber: "40817810570000123456"), "408—17—810—5—7000—0123456")
        XCTAssertEqual(flawlessValidation.toAccountFormat(accountNumber: "4081781057000012345612"), "")
    }
    
    func testCardNumberFormating() {
        XCTAssertEqual(flawlessValidation.toCardFormat(cardNumber: "4276380012345890"), "4276-3800-1234-5890")
        XCTAssertEqual(flawlessValidation.toCardFormat(cardNumber: "4916094179595539752"), "4916-0941-7959-5539752")
    }
    
    func testPanValidation() {
        XCTAssertFalse(flawlessValidation.PanValidate(cardNumber: "1234234534564567"), "Номер карты Валиден")
        XCTAssertTrue(flawlessValidation.PanValidate(cardNumber: "5321300371054706"), "Номер карты Не Валиден")
    }
    
    func testAccountValidation() {
        XCTAssertTrue(flawlessValidation.isValid(accountNumber: "40817810938052338205", bik: "044525225"), "Ошибка - введенный номер счета должен быть валиден")
        XCTAssertFalse(flawlessValidation.isValid(accountNumber: "40317710938552338209", bik: "044325827"), "Ошибка - введенный номер счета должен быть не валиден")
    }
}
