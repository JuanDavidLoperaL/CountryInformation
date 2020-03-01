//
//  HomeCountriesViewModelTest.swift
//  CountriesTests
//
//  Created by Juan David Lopera Lopez on 3/1/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import XCTest

@testable import Countries

final class HomeCountriesViewModelTest: XCTestCase {
    
    //MARK:- Properties
    var homeCountriesViewModel: HomeCountriesViewModelProtocol!
    var api: HomeCountriesAPIProtocol!

    override func setUp() {
        api = HomeCountriesAPIMock()
        homeCountriesViewModel = HomeCountriesViewModel(api: api)
    }

    override func tearDown() {
        api = nil
        homeCountriesViewModel = nil
    }

    func testGetNumberOfCountriesEqualToOne() {
        homeCountriesViewModel.getCountryBy(name: "Colombia") { _ in  }
        XCTAssertTrue(homeCountriesViewModel.getNumberOfCountries() == 1)
    }

    func testGetNumberOfCountriesGreaterThanOne() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertTrue(homeCountriesViewModel.getNumberOfCountries() > 1)
    }

    func testGetCountryNameByIndexEqualToZero() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertEqual(homeCountriesViewModel.getCountryNameBy(index: 0), "United States of America")
    }

    func testGetCountryNameByIndexEqualToOne() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertEqual(homeCountriesViewModel.getCountryNameBy(index: 1), "United Republic of Tanzania")
    }

    func testGetCountryCurrencyByIndexEqualToZero() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertEqual(homeCountriesViewModel.getCountryCurrencyBy(index: 0), "America Dollar")
    }

    func testGetCountryCurrencyByIndexEqualToOne() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertEqual(homeCountriesViewModel.getCountryCurrencyBy(index: 1), "Tanzanian Shilling")
    }

    func testGetCountryPopulationByIndexEqualToZero() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertEqual(homeCountriesViewModel.getCountryPopulationBy(index: 0), "323947000")
    }

    func testGetCountryPopulationByIndexEqualToOne() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertEqual(homeCountriesViewModel.getCountryPopulationBy(index: 1), "55155000")
    }

    func testGetCountryInformationsByIndexNotNil() {
        homeCountriesViewModel.getCountryBy(name: "Uni") { _ in  }
        XCTAssertNotNil(homeCountriesViewModel.getCountryInformationsBy(index: 0))
    }
}
