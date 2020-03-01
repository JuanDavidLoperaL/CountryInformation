//
//  DetailCountryViewModelTest.swift
//  CountriesTests
//
//  Created by Juan David Lopera Lopez on 3/1/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import XCTest
@testable import Countries

final class DetailCountryViewModelTest: XCTestCase {

    //MARK:- Properties
    var detailCountryViewModel: DetailCountryViewModel!
    var country: Country!

    override func setUp() {
        country = Country(name: "Colombia", callingCodes: ["57"], capital: "Bogota D.C", region: "America", subregion: "South America", population: 47000000, borders: ["Brazil", "Venezuela", "Ecuador"], currencies: [CurrencyCountry(code: "", name: "Colombian Peso", symbol: "COP$")], languages: [CountryLanguage(name: "Espanish")], flag: "")
        detailCountryViewModel = DetailCountryViewModel(country: country)
    }

    override func tearDown() {
        country = nil
        detailCountryViewModel = nil
    }

    func testCountryName() {
        XCTAssertEqual(detailCountryViewModel.name, "Colombia")
    }

    func testCountryCapital() {
        XCTAssertEqual(detailCountryViewModel.capital, "Capital: Bogota D.C")
    }

    func testCountryPopulation() {
        XCTAssertEqual(detailCountryViewModel.population, "Currently population: 470000.0")
    }

    func testCountryLanguage() {
        XCTAssertEqual(detailCountryViewModel.language, "Official language: Espanish")
    }

    func testCountryLocated() {
        XCTAssertEqual(detailCountryViewModel.localization, "Is located in: America")
    }
}
