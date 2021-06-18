//
//  SuccessViewController.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit

class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

}
