//
//  DelegateCountriesTableView.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation
import UIKit

final class DelegateCountriesTableView: NSObject, UITableViewDelegate {

    //MARK:- Properties
    private let viewModel: HomeCountriesViewModelProtocol

    init(viewModel: HomeCountriesViewModelProtocol = HomeCountriesViewModel()) {
        self.viewModel = viewModel
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
