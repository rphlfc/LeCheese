//
//  Cheese.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 12/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import Foundation

struct Cheese: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
}

let cheeseData = [
    Cheese(imageName: "camembert", name: "Camembert"),
    Cheese(imageName: "lamb-chopper", name: "Lamb Chopper"),
    Cheese(imageName: "saint-agur", name: "Saint Agur")
]
