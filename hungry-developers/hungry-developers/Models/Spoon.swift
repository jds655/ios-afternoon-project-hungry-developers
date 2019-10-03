//
//  Spoon.swift
//  hungry-developers
//
//  Created by Joshua Sharp on 10/2/19.
//  Copyright © 2019 Empty Bliss. All rights reserved.
//

protocol SpoonDelegate {
    func pickedUp(_ id: Int, _ by: Int)
    func putDown(_ id: Int)
}

import Foundation

class Spoon {
    var id: Int
    var lock: Bool = false
    var delegate: SpoonDelegate?
    private var idHolding: Int?
    
    init (with id: Int, delegate: SpoonDelegate? = nil) {
        self.id = id
        print ("Spoon \(id) created.")
    }
    
    func pickUp(with id: Int) -> Bool {
        if !self.lock {
            self.lock = true
            idHolding = id
            delegate?.pickedUp(self.id, id)
            print ("Spoon \(self.id) picked up dy Developer \(id)")
            return true
        }
        return false
    }
    
    func putDown() {
        self.lock = false
        print ("Spoon \(id) dropped by Developer: \(self.idHolding ?? -1).")
        self.idHolding = nil
        delegate?.putDown(self.id)
        
    }
    
}
