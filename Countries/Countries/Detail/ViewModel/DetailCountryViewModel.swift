//
//  DetailCountryViewModel.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 3/1/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

final class DetailCountryViewModel {

    //MARK:- Properties
    let country: Country

    init(country: Country) {
        self.country = country
    }

    var name: String {
        return country.name
    }

    var flagURL: URL {
        return URL(string: country.flag) ?? URL(fileURLWithPath: "")
    }

    var population: String {
        let populationDouble: Double = Double(country.population)
        let populationResult = populationDouble / 100
        return "Currently population: \(String(populationResult))"
    }

    var language: String {
        return "Official language: \(country.languages[0].name)"
    }

    var capital: String {
        return "Capital: \(country.capital)"
    }

    var localization: String {
        return "Is located in: \(country.region)"
    }
}
