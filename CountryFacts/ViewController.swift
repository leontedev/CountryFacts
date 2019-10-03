//
//  ViewController.swift
//  CountryFacts
//
//  Created by Mihai Leonte on 9/30/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let bundlePath = Bundle.main.bundlePath
        if let items = try? FileManager.default.contentsOfDirectory(atPath: bundlePath) {
            for item in items {
                if item.hasSuffix(".json") {
                    let fileName = String(item.split(separator: ".")[0])
                    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { continue }
                    let url = URL(fileURLWithPath: path)
                    guard let json = try? Data(contentsOf: url) else { continue }
                    
                    do {
                        let country = try JSONDecoder().decode(Country.self, from: json)
                        countries.append(country)
                    } catch (let error) {
                        print(error)
                    }
                    
                }
            }
        }
    }
    
    // MARK: - Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].government.countryName.shortForm.text
        cell.detailTextLabel?.text = countries[indexPath.row].government.countryName.longForm.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = storyboard?.instantiateViewController(identifier: "DetailID") as? DetailViewController else { return }
        
        detailVC.country = countries[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

