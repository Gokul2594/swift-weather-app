//
//  ViewController.swift
//  WeatherViewer
//
//  Created by Gokul Viswanathan on 2019-07-14.
//  Copyright © 2019 Gokul Viswanathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerLabel)
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(temperatureLabel)
        view.addSubview(temperatureValueLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionValueLabel)
        
        toggleDisplay(isHidden: true)
        view.setNeedsUpdateConstraints()
    }

    lazy var headerLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = view.font.withSize(36)
        view.text = "Weather Viewer"
        view.textAlignment = .center
        
        return view
    }()
    
    lazy var searchTextField: UITextField! = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = "City"
        view.textAlignment = .left
        view.font = .systemFont(ofSize: 24)
        
        return view
    }()
    
    lazy var searchButton: UIButton! = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Search", for: .normal)
        view.backgroundColor = UIColor.white
        view.setTitleColor(UIColor.black, for: .normal)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.addTarget(self, action: #selector(onSearchClicked), for: .touchDown)
        
        return view
    }()
    
    private func toggleDisplay(isHidden: Bool) {
        temperatureLabel.isHidden = isHidden
        temperatureValueLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        descriptionValueLabel.isHidden = isHidden
    }
    
    @objc func onSearchClicked() {
        guard let location = searchTextField.text else {
            print("Error getting data")
            return
        }
        let apiManager = ApiManager()
        let weatherData = apiManager.getWeatherDate(location: location)
        
        temperatureValueLabel.text = String(weatherData.currentTemperature) + "°C"
        descriptionValueLabel.text = weatherData.description
        toggleDisplay(isHidden: false)
    }
    
    ///function to create Label
    func createLabel(text: String) -> UILabel {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = text
        view.font = view.font.withSize(20)
        return view
    }
    
    lazy var temperatureLabel: UILabel! = {
        return createLabel(text: "Temperature:")
    }()
    
    lazy var temperatureValueLabel: UILabel! = {
        return createLabel(text: "20°C")
    }()
    
    lazy var descriptionLabel: UILabel! = {
        return createLabel(text: "Description:")
    }()
    
    lazy var descriptionValueLabel: UILabel! = {
        return createLabel(text: "Sunny")
    }()
    
    override func updateViewConstraints() {
        let margins = view.layoutMarginsGuide
        
        headerLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 15).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 5).isActive = true
        
        temperatureLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        temperatureValueLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        temperatureValueLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionValueLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 20).isActive = true
        descriptionValueLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        
        super.updateViewConstraints()
    }
}

