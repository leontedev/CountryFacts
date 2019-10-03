//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Mihai Leonte on 10/2/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var longNameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    @IBOutlet var backgroundLabel: UILabel!
    
    
    var country: Country!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = country.government.countryName.shortForm.text
        navigationController?.navigationBar.prefersLargeTitles = false
        
        var longNameAndPopulation = "\(country.government.countryName.longForm.text)"
        if let population = country.people.Population.text {
            longNameAndPopulation += "\nPop. \(population)"
        }
        
        longNameLabel.text = longNameAndPopulation
        locationLabel.text = country.geography.Location.text
        backgroundLabel.text = country.introduction.Background.text
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: backgroundLabel.bottomAnchor).isActive = true
        
        
    }
}
