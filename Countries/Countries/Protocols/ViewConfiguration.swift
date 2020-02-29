//
//  ViewConfiguration.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

protocol ViewConfiguration {
    func addSubviews()
    func addConstraints()
    func configureViews()
    func setup()
}

extension ViewConfiguration {
    func setup() {
        addSubviews()
        addConstraints()
        configureViews()
    }
}
