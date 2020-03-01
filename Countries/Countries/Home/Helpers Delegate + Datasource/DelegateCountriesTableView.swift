//
//  DelegateCountriesTableView.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation
import UIKit

protocol DelegateCountriesTableViewProtocol {
    func countrySelected(country: Country)
}

final class DelegateCountriesTableView: NSObject, UITableViewDelegate {

    //MARK:- Properties
    private let viewModel: HomeCountriesViewModelProtocol
    private var delegate: DelegateCountriesTableViewProtocol?

    init(viewModel: HomeCountriesViewModelProtocol = HomeCountriesViewModel()) {
        self.viewModel = viewModel

    }

    func set(delegate: DelegateCountriesTableViewProtocol) {
        self.delegate = delegate
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country: Country = viewModel.getCountryInformationsBy(index: indexPath.row)
        delegate?.countrySelected(country: country)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
