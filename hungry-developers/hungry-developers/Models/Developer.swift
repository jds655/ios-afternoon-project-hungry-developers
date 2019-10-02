//
//  Developer.swift
//  hungry-developers
//
//  Created by Joshua Sharp on 10/2/19.
//  Copyright © 2019 Empty Bliss. All rights reserved.
//

import Foundation

protocol DeveloperDelegate {
    func startThinking(_ id: Int)
    func startEating(_ id: Int)
}

class Developer {
    var id: Int
    var leftSpoon: Spoon
    var rightSpoon: Spoon
    var delegate: DeveloperDelegate?
    var running: Bool = true
    private var hasLeftSpoon: Bool = false
    private var hasRightSpoon: Bool = false
    private let lock = NSLock()
    
    init (with id: Int, leftSpoon: Spoon, rightSpoon: Spoon, delegate: DeveloperDelegate? = nil) {
        self.id = id
        self.leftSpoon = leftSpoon
        self.rightSpoon = rightSpoon
        self.delegate = delegate
        print ("Developer \(id) created with Spoon \(self.leftSpoon.id) in the left hand and Spoon \(self.rightSpoon.id) in the right.")
    }
    
    func think() {
        print ("Developer \(id) started thinking.")
        delegate?.startThinking(self.id)
        let queue = DispatchQueue.init(label: "Developer \(self.id) Thinking Queue")
        queue.async {
            while !self.leftSpoon.pickUp(with: self.id) {}
            self.hasLeftSpoon = true
        }
        queue.async {
            while !self.rightSpoon.pickUp(with: self.id) {}
            
            self.hasRightSpoon = true
        }
        while !hasRightSpoon && !hasLeftSpoon {}
        print ("Developer \(id) has both spoons, now eating.")
    }
    
    func eat() {
        print ("Developer \(id) started eating.")
        let timeToSleep: Int = Int.random(in: 3000...6000)
        delegate?.startEating(self.id)
        usleep(UInt32(timeToSleep))
        self.rightSpoon.putDown()
        self.leftSpoon.putDown()
        self.hasRightSpoon = false
        self.hasLeftSpoon = false
        print ("Developer \(id) stopped eating.")
    }
    
    func run() {
        while running {
            self.think()
            self.eat()
        }
    }
    
    func stop() {
        running = false
    }
}
