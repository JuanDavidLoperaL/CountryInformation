//
//  HomeCountriesAPIMock.swift
//  CountriesTests
//
//  Created by Juan David Lopera Lopez on 3/1/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import XCTest

@testable import Countries

final class HomeCountriesAPIMock: HomeCountriesAPIProtocol {
    
    func getCountryBy(name: String, completionHandler: @escaping (Result<[Country], InternetError>) -> Void) {
        if name == "Uni" {
            let countryUSA: Country = Country(name: "United States of America", callingCodes: ["1"], capital: "Washington D.C.", region: "America", subregion: "North America", population: 323947000, borders: ["Canada, Mexico"], currencies: [CurrencyCountry(code: "", name: "America Dollar", symbol: "$")], languages: [CountryLanguage(name: "English")], flag: "")
            let countryTanzania: Country = Country(name: "United Republic of Tanzania", callingCodes: ["1"], capital: "Dodoma", region: "Africa", subregion: "Eastern Africa", population: 55155000, borders: ["BDI", "COD", "KEN", "MOZ"], currencies: [CurrencyCountry(code: "", name: "Tanzanian Shilling", symbol: "Sh")], languages: [CountryLanguage(name: "Swahili")], flag: "")
            completionHandler(.success([countryUSA, countryTanzania]))
        } else if name == "Colombia" {
            let countryColombia: Country = Country(name: "Colombia", callingCodes: ["57"], capital: "Bogota D.C", region: "America", subregion: "South America", population: 47000000, borders: ["Brazil", "Venezuela", "Ecuador"], currencies: [CurrencyCountry(code: "", name: "Colombian Peso", symbol: "COP$")], languages: [CountryLanguage(name: "Espanish")], flag: "")
            completionHandler(.success([countryColombia]))
        } else {
            completionHandler(.failure(.onResponse))
        }
    }
}
