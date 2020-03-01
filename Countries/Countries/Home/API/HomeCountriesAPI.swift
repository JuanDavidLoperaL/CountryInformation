//
//  HomeCountriesAPI.swift
//  Countries
//
//  Created by Juan David Lopera Lopez on 2/29/20.
//  Copyright © 2020 Juan David Lopera Lopez. All rights reserved.
//

import Foundation

enum InternetError: Error {
    case onRequest
    case onResponse
}

//MARK:- Protocol
protocol HomeCountriesAPIProtocol: AnyObject {
    func getCountryBy(name: String, completionHandler: @escaping(Result<[Country], InternetError>) -> Void)
}

final class HomeCountriesAPI: HomeCountriesAPIProtocol {

    //MARK:- Properties
    private let baseURL: String
    private let defaultSession: URLSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?

    init(baseURL: String = "") {
        self.baseURL = baseURL
    }

    func getCountryBy(name: String, completionHandler: @escaping (Result<[Country], InternetError>) -> Void) {
        dataTask?.cancel()
        if let urlComponents = URLComponents(string: "\(baseURL)name/\(name)") {
            guard let url = urlComponents.url else {
                completionHandler(.failure(.onRequest))
                return
            }
            dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
                    defer {
                        self?.dataTask = nil
                    }
                    if error != nil {
                        completionHandler(.failure(.onResponse))
                    } else if
                        let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        do {
                            let countryObject = try JSONDecoder().decode([Country].self, from: data)
                            completionHandler(.success(countryObject))
                        } catch {
                            completionHandler(.failure(.onResponse))
                        }
                    } else {
                        completionHandler(.failure(.onResponse))
                }
            }
            dataTask?.resume()
        } else {
            completionHandler(.failure(.onRequest))
        }
    }
}

