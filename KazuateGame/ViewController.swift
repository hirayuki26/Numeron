//
//  ViewController.swift
//  KazuateGame
//
//  Created by NinseiFukaya on 2022/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var start: UIButton!
    
    @IBOutlet var saikoukiroku: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
       @IBAction func tapStart() {
        self.performSegue(withIdentifier: "toNext", sender: self)
        
    }
    
}

extension UIButton {
    func disappear() {
        self.isHidden = true
        self.isEnabled = false
    }
    func appear() {
        self.isHidden = false
        self.isEnabled = true
    }
}
