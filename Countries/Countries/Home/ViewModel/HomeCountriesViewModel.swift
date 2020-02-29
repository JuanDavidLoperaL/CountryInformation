//
//  HomeCountriesViewModel.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

protocol HomeCountriesViewModelProtocol {
    func getCountryBy(name: String, completionHandler: @escaping(_ result: Bool) -> Void)
    func getNumberOfCountries() -> Int
    func getCountryNameBy(index: Int) -> String
    func getCountryCurrencyBy(index: Int) -> String
    func getCountryPopulationBy(index: Int) -> String
}

final class HomeCountriesViewModel: HomeCountriesViewModelProtocol {

    //MARK:- Properties
    private let api: HomeCountriesAPIProtocol
    private var countries: [Country] = [Country]()

    init(api: HomeCountriesAPIProtocol = HomeCountriesAPI(baseURL: "https://restcountries.eu/rest/v2/")) {
        self.api = api
    }

    //MARK:- Protocols functions
    func getCountryBy(name: String, completionHandler: @escaping (_ result: Bool) -> Void) {
        if name.isEmpty {
            completionHandler(false)
        } else {
            api.getCountryBy(name: name) { [weak self] result in
                guard let self = self else {
                    return
                }
                switch result {
                case .success(let countries):
                    self.countries = countries
                    completionHandler(true)
                case .failure:
                    completionHandler(false)
                }
            }
        }
    }

    func getNumberOfCountries() -> Int {
        return countries.count
    }

    func getCountryNameBy(index: Int) -> String {
        if index <= countries.count {
            return countries[index].name
        } else {
            return ""
        }
    }

    func getCountryCurrencyBy(index: Int) -> String {
        if index <= countries.count {
            return countries[index].currencies[0].name
        } else {
            return ""
        }
    }

    func getCountryPopulationBy(index: Int) -> String {
        if index <= countries.count {
            return String(countries[index].population)
        } else {
            return ""
        }
    }
}
