//
//  ModelController.swift
//  hungry-developers
//
//  Created by Joshua Sharp on 10/2/19.
//  Copyright © 2019 Empty Bliss. All rights reserved.
//

import Foundation
class ModelController {
    var devs: [Developer] = []
    var spoons: [Spoon] = []
    
    init () {
        //Create Spoons
        for i in 1...5 {
            spoons.append(Spoon(with: i))
        }
        //Create Developers
        for i in 1...5 {
            switch i {
            case 1:
                devs.append(Developer(with: i, leftSpoon: spoons[0], rightSpoon: spoons[4]))
            case 2:
                devs.append(Developer(with: i, leftSpoon: spoons[1], rightSpoon: spoons[0]))
            case 3:
                devs.append(Developer(with: i, leftSpoon: spoons[2], rightSpoon: spoons[1]))
            case 4:
                devs.append(Developer(with: i, leftSpoon: spoons[3], rightSpoon: spoons[2]))
            case 5:
                devs.append(Developer(with: i, leftSpoon: spoons[4], rightSpoon: spoons[3]))
            default:
                break
            }
        }
    }
}
