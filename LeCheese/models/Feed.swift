//
//  Feed.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 12/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import Foundation

struct Feed: Identifiable {
    let id = UUID()
    let cheese: Cheese
}

let feedData = [
    Feed(cheese: cheeseData[0]),
    Feed(cheese: cheeseData[1]),
    Feed(cheese: cheeseData[2])
]


