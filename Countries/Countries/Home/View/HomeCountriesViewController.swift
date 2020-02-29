//
//  HomeCountriesViewController.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import UIKit
import SnapKit

final class HomeCountriesViewController: UIViewController {

    //MARK: - IBOutlet
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "countriesBackGround")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var searchCountryTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = .gray
        textField.autocorrectionType = .no
        textField.borderStyle = .roundedRect
        textField.textColor = .white
        return textField
    }()

    private lazy var searchCountryButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("G O", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()

    private lazy var countriesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = UIColor.clear
        tableView.isHidden = true
        tableView.separatorStyle = .none
        return tableView
    }()

    private var loadingView: LoadingView?

    //MARK:- Properties
    private let countriesDatasource: DatasourceCountriesTableView
    private let countriesDelegate: DelegateCountriesTableView
    private let viewModel: HomeCountriesViewModelProtocol

    init(viewModel: HomeCountriesViewModelProtocol = HomeCountriesViewModel()) {
        self.viewModel = viewModel
        self.countriesDelegate = DelegateCountriesTableView(viewModel: self.viewModel)
        self.countriesDatasource = DatasourceCountriesTableView(viewModel: self.viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView = LoadingView(inView: self.view)
        setup()
        registerCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    //MARK: Private functions
    @objc private func searchButtonAction() {
        getCountriesInformation()
    }

    private func getCountriesInformation() {
        view.endEditing(true)
        loadingView?.isLoading(true)
        let countryToSearchInformation = searchCountryTextField.text
        viewModel.getCountryBy(name: countryToSearchInformation ?? "") { [weak self] response in
            guard let self =  self else {
                return
            }
            DispatchQueue.main.async {
                if response {
                    self.countriesTableView.reloadData()
                    self.countriesTableView.isHidden = false
                } else {
                    self.countriesTableView.isHidden = true
                    self.showErrorView()
                }
                self.loadingView?.isLoading(false)
            }
        }
    }

    private func showErrorView() {
        let alert: UIAlertController = UIAlertController(title: "Sorry...", message: "Something happened while app was trying to get countries information, be sure that you are typing a correct country name and try again.", preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    private func registerCell() {
        countriesTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryCell")
    }
}

extension HomeCountriesViewController: ViewConfiguration {

    func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(searchCountryTextField)
        view.addSubview(searchCountryButton)
        view.addSubview(countriesTableView)
        view.addSubview(loadingView ?? UIView())
    }

    func addConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }

        searchCountryTextField.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80.0)
            make.leading.equalTo(view.snp.leading).offset(15.0)
            make.size.equalTo(CGSize(width: view.frame.width * 0.70, height: 30))
        }

        searchCountryButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80.0)
            make.trailing.equalTo(view.snp.trailing).offset(-10.0)
            make.leading.equalTo(searchCountryTextField.snp.trailing).offset(10.0)
            make.height.equalTo(30.0)
        }

        countriesTableView.snp.makeConstraints { make in
            make.top.equalTo(searchCountryTextField.snp.bottom).offset(70.0)
            make.leading.equalTo(view.snp.leading).offset(15.0)
            make.trailing.equalTo(view.snp.trailing).offset(-15.0)
            make.bottom.equalTo(view.snp.bottom).offset(-15.0)
        }

        loadingView?.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }

    func configureViews() {
        searchCountryTextField.delegate = self
        searchCountryButton.addTarget(self, action: #selector(searchButtonAction), for: .touchDown)
        countriesTableView.dataSource = countriesDatasource
        countriesTableView.delegate = countriesDelegate
        loadingView?.isLoading(false)
    }
}

extension HomeCountriesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        getCountriesInformation()
        return true
    }
}
