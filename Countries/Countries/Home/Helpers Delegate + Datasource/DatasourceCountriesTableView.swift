//
//  DatasourceCountriesTableView.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation
import UIKit

final class DatasourceCountriesTableView: NSObject, UITableViewDataSource {

    //MARK:- Properties
    private let viewModel: HomeCountriesViewModelProtocol

    init(viewModel: HomeCountriesViewModelProtocol = HomeCountriesViewModel()) {
        self.viewModel = viewModel
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfCountries()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryTableViewCell else {
            return UITableViewCell()
        }
        cell.set(viewModel: self.viewModel, index: indexPath.row)
        return cell
    }
}
