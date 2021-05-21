//
//  ViewController.swift
//  Ehon
//
//  Created by okeiosdeveloper on 2021/05/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Start(_ sender: UIButton) {
        let nc=NextController()
        navigationController?.pushViewController(nc, animated: true)
    }
    
}

