//
//  Countries.swift
//  CountryFacts
//
//  Created by Mihai Leonte on 10/1/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import Foundation


struct Country: Codable {
    
    enum CodingKeys: String, CodingKey {
        case people = "People and Society"
        case introduction = "Introduction"
        case geography = "Geography"
        case government = "Government"
    }
    
    struct Introduction: Codable {
        struct Background: Codable {
            let text: String
        }
        
        let Background: Background
    }
    
    struct Geography: Codable {
        struct Location: Codable {
            let text: String
        }
        let Location: Location
    }
    
    struct Government: Codable {
        struct CountryName: Codable {
            struct ShortForm: Codable {
                let text: String
            }
            
            struct LongForm: Codable {
                let text: String
            }
            enum CodingKeys: String, CodingKey {
                case shortForm = "conventional short form"
                case longForm = "conventional long form"
            }
            
            let shortForm: ShortForm
            let longForm: LongForm
        }
        
        enum CodingKeys : String, CodingKey {
            case countryName = "Country name"
        }
        
        let countryName: CountryName
        
    }
    
    struct People: Codable {
        struct Population: Codable {
            let text: String?
        }

        let Population: Population
    }
    
    let introduction: Introduction
    let geography: Geography
    let government: Government
    let people: People
}

//"People and Society": {
//  "Population": {
//    "text": "2,209,208",
//    "note": {
