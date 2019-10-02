//
//  ViewController.swift
//  hungry-developers
//
//  Created by Joshua Sharp on 10/2/19.
//  Copyright © 2019 Empty Bliss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var modelController = ModelController()
    let stoppedColor = UIColor.red.cgColor
    let thinkingColor = UIColor.yellow.cgColor
    let eatingColor = UIColor.green.cgColor
    let heldColor = UIColor.green.cgColor
    let droppedColor = UIColor.red.cgColor
    
    //MARK: - IBOutlets
    @IBOutlet weak var dev1: UILabel!
    @IBOutlet weak var dev2: UILabel!
    @IBOutlet weak var dev3: UILabel!
    @IBOutlet weak var dev4: UILabel!
    @IBOutlet weak var dev5: UILabel!
    
    @IBOutlet weak var s1: UILabel!
    @IBOutlet weak var s2: UILabel!
    @IBOutlet weak var s3: UILabel!
    @IBOutlet weak var s4: UILabel!
    @IBOutlet weak var s5: UILabel!
    
    
    //MARK: - Properties
    
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0...4 {
            modelController.spoons[i].delegate = self
            modelController.devs[i].delegate = self
        }
        
        updateViews()
    }

    @IBAction func startTapped(_ sender: Any) {
        startEating()
    }
    
    private func startEating() {
        DispatchQueue.concurrentPerform(iterations: 5) {
            modelController.devs[$0].run()
        }
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        stopEating()
    }
    
    private func stopEating () {
        for i in 0...4 {
            modelController.devs[i].stop()
        }
    }

    private func updateViews() {
        dev1.layer.backgroundColor = stoppedColor
        dev2.layer.backgroundColor = stoppedColor
        dev3.layer.backgroundColor = stoppedColor
        dev4.layer.backgroundColor = stoppedColor
        dev5.layer.backgroundColor = stoppedColor
        s1.layer.backgroundColor = droppedColor
        s2.layer.backgroundColor = droppedColor
        s3.layer.backgroundColor = droppedColor
        s4.layer.backgroundColor = droppedColor
        s5.layer.backgroundColor = droppedColor
    }

    private func pickUpSpoon(_ id: Int) {
        DispatchQueue.main.async {
            if self.s1.tag == id {self.s1.layer.backgroundColor = self.heldColor}
            if self.s2.tag == id {self.s1.layer.backgroundColor = self.heldColor}
            if self.s3.tag == id {self.s1.layer.backgroundColor = self.heldColor}
            if self.s4.tag == id {self.s1.layer.backgroundColor = self.heldColor}
            if self.s5.tag == id {self.s1.layer.backgroundColor = self.heldColor}
        }
    }
    
    private func dropSpoon(_ id: Int) {
        DispatchQueue.main.async {
            if self.s1.tag == id {self.s1.layer.backgroundColor = self.droppedColor}
            if self.s2.tag == id {self.s1.layer.backgroundColor = self.droppedColor}
            if self.s3.tag == id {self.s1.layer.backgroundColor = self.droppedColor}
            if self.s4.tag == id {self.s1.layer.backgroundColor = self.droppedColor}
            if self.s5.tag == id {self.s1.layer.backgroundColor = self.droppedColor}
        }
    }

    private func thinkingDev (_ id: Int) {
        DispatchQueue.main.async {
            if self.dev1.tag == id {self.dev1.layer.backgroundColor = self.thinkingColor}
            if self.dev2.tag == id {self.dev1.layer.backgroundColor = self.thinkingColor}
            if self.dev3.tag == id {self.dev1.layer.backgroundColor = self.thinkingColor}
            if self.dev4.tag == id {self.dev1.layer.backgroundColor = self.thinkingColor}
            if self.dev5.tag == id {self.dev1.layer.backgroundColor = self.thinkingColor}
        }
    }
    
    private func eatingDev(_ id: Int) {
        DispatchQueue.main.async {
            if self.dev1.tag == id {self.dev1.layer.backgroundColor = self.eatingColor}
            if self.dev2.tag == id {self.dev1.layer.backgroundColor = self.eatingColor}
            if self.dev3.tag == id {self.dev1.layer.backgroundColor = self.eatingColor}
            if self.dev4.tag == id {self.dev1.layer.backgroundColor = self.eatingColor}
            if self.dev5.tag == id {self.dev1.layer.backgroundColor = self.eatingColor}
        }
    }
    
}



extension ViewController: DeveloperDelegate {
    func startThinking(_ id: Int) {
        thinkingDev(id)
    }
    
    func startEating(_ id: Int) {
        eatingDev(id)
    }
}

extension ViewController: SpoonDelegate {
    func pickedUp(_ id: Int, _ by: Int) {
        pickUpSpoon(id)
    }
    
    func putDown(_ id: Int) {
        dropSpoon(id)
    }
}
