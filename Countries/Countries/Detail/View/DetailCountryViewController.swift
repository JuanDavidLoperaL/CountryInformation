//
//  DetailCountryViewController.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 3/1/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import UIKit
import Kingfisher

final class DetailCountryViewController: UIViewController {

    //MARK:- IBOutlet
    private lazy var backgroundDetail: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "detailBackground")
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var countryNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "detailBackground")
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var countryLanguageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private lazy var countryPopulationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private lazy var countryCapitalLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private lazy var countryLocatedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    //MARK:- Properties
    let viewModel: DetailCountryViewModel

    init(viewModel: DetailCountryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
}

extension DetailCountryViewController: ViewConfiguration {
    func addSubviews() {
        view.addSubview(backgroundDetail)
        view.addSubview(countryNameLabel)
        view.addSubview(countryFlagImageView)
        view.addSubview(countryPopulationLabel)
        view.addSubview(countryLanguageLabel)
        view.addSubview(countryCapitalLabel)
        view.addSubview(countryLocatedLabel)
    }

    func addConstraints() {
        backgroundDetail.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }

        countryNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(120.0)
            make.leading.equalTo(view.snp.leading).offset(20.0)
            make.trailing.equalTo(view.snp.trailing).offset(-20.0)
        }

        countryFlagImageView.snp.makeConstraints { make in
            make.top.equalTo(countryNameLabel.snp.bottom).offset(20.0)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }

        countryPopulationLabel.snp.makeConstraints { make in
            make.top.equalTo(countryFlagImageView.snp.bottom).offset(20.0)
            make.leading.equalTo(view.snp.leading).offset(20.0)
            make.trailing.equalTo(view.snp.trailing).offset(-20.0)
        }

        countryLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(countryPopulationLabel.snp.bottom).offset(20.0)
            make.leading.equalTo(view.snp.leading).offset(20.0)
            make.trailing.equalTo(view.snp.trailing).offset(-20.0)
        }

        countryCapitalLabel.snp.makeConstraints { make in
            make.top.equalTo(countryLanguageLabel.snp.bottom).offset(20.0)
            make.leading.equalTo(view.snp.leading).offset(20.0)
            make.trailing.equalTo(view.snp.trailing).offset(-20.0)
        }

        countryLocatedLabel.snp.makeConstraints { make in
            make.top.equalTo(countryCapitalLabel.snp.bottom).offset(20.0)
            make.leading.equalTo(view.snp.leading).offset(20.0)
            make.trailing.equalTo(view.snp.trailing).offset(-20.0)
        }
    }

    func configureViews() {
        countryNameLabel.text = viewModel.name
        countryFlagImageView.kf.setImage(with: viewModel.flagURL)
        countryPopulationLabel.text = viewModel.population
        countryLanguageLabel.text = viewModel.language
        countryCapitalLabel.text = viewModel.capital
        countryLocatedLabel.text = viewModel.localization
    }
}
