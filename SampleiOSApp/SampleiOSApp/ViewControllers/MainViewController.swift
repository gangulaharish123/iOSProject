//
//  ViewController.swift
//  SampleiOSApp
//
//  Created by hgangula on 14/02/23.
//

import UIKit
import AuthenticationServices

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createPasswordBtnClick(_ sender: UIButton) {
        let createPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.createPasswordViewController) as! CreatePasswordViewController
        self.navigationController?.pushViewController(createPasswordViewController, animated: true)
    }
}

