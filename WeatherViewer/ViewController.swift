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
        
        return view
    }()

    override func updateViewConstraints() {
        let margins = view.layoutMarginsGuide
        
        headerLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 15).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 5).isActive = true
        
        super.updateViewConstraints()
    }
}

