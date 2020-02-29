//
//  Country.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String
    var callingCodes: [String]
    var capital: String
    var region: String
    var subregion: String
    var population: Int
    var borders: [String]
    var currencies: [CurrencyCountry]
    var languages: [CountryLanguage]
    var flag: String
}
