//
//  ShowPasswordViewController.swift
//  SampleiOSApp
//
//  Created by hgangula on 14/02/23.
//

import UIKit

class ShowPasswordViewController: UIViewController {
    @IBOutlet weak var lblPassword: UILabel!
    
    let viewModel = StorageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Show Password"
        // Get the password from the Keychain.
        lblPassword.text = viewModel.loadPassword().password
    }
}
