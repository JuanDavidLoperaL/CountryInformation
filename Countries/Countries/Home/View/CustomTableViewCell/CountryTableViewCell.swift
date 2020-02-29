//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import UIKit
import SnapKit

class CountryTableViewCell: UITableViewCell {

    //MARK:- IBOutlet
    private lazy var subContainerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()

    private lazy var countryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.text = "Country:"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    private lazy var countryNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        return label
    }()

    private lazy var currencyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.text = "Currency:"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    private lazy var currencyNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        return label
    }()

    private lazy var populationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.text = "Population:"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()

    private lazy var populationNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .left
        return label
    }()

    //MARK:- Properties
    private var viewModel: HomeCountriesViewModelProtocol = HomeCountriesViewModel()
    private var index: Int = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(viewModel: HomeCountriesViewModelProtocol, index: Int) {
        self.viewModel = viewModel
        self.index = index
        setInformations()

    }

    private func setInformations() {
        countryNameLabel.text = self.viewModel.getCountryNameBy(index: index)
        currencyNameLabel.text = self.viewModel.getCountryCurrencyBy(index: index)
        populationNumberLabel.text = self.viewModel.getCountryPopulationBy(index: index)
    }
}

extension CountryTableViewCell: ViewConfiguration {
    func addSubviews() {
        contentView.addSubview(subContainerView)
        subContainerView.addSubview(countryLabel)
        subContainerView.addSubview(countryNameLabel)
        subContainerView.addSubview(currencyLabel)
        subContainerView.addSubview(currencyNameLabel)
        subContainerView.addSubview(populationLabel)
        subContainerView.addSubview(populationNumberLabel)
    }

    func addConstraints() {
        subContainerView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12.0)
            make.leading.equalTo(contentView.snp.leading).offset(12.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-12.0)
            make.bottom.equalTo(contentView.snp.bottom).offset(-12.0)
        }

        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(subContainerView.snp.top).offset(10.0)
            make.leading.equalTo(subContainerView.snp.leading).offset(10.0)
            make.width.equalTo(55.0)
        }

        countryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(subContainerView.snp.top).offset(11.0)
            make.leading.equalTo(countryLabel.snp.trailing).offset(5.0)
            make.trailing.equalTo(subContainerView.snp.trailing).offset(-10.0)
        }

        currencyLabel.snp.makeConstraints { make in
            make.top.equalTo(countryNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(subContainerView.snp.leading).offset(10.0)
            make.width.equalTo(60.0)
        }

        currencyNameLabel.snp.makeConstraints { make in
            make.top.equalTo(countryNameLabel.snp.bottom).offset(6)
            make.leading.equalTo(countryLabel.snp.trailing).offset(5.0)
            make.trailing.equalTo(subContainerView.snp.trailing).offset(-10.0)
        }

        populationLabel.snp.makeConstraints { make in
            make.top.equalTo(currencyLabel.snp.bottom).offset(5)
            make.leading.equalTo(subContainerView.snp.leading).offset(10.0)
            make.width.equalTo(70.0)
        }

        populationNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(currencyLabel.snp.bottom).offset(6)
            make.leading.equalTo(populationLabel.snp.trailing).offset(5.0)
            make.trailing.equalTo(subContainerView.snp.trailing).offset(-10.0)
        }

    }

    func configureViews() {
        backgroundColor = .clear
        subContainerView.layer.cornerRadius = 5
        subContainerView.layer.borderWidth = 1
        subContainerView.layer.borderColor = UIColor.white.cgColor
        subContainerView.backgroundColor = .gray
        selectionStyle = .none
    }
}
