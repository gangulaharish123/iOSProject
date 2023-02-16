//
//  CreatePasswordViewController.swift
//  SampleiOSApp
//
//  Created by hgangula on 14/02/23.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let viewModel = StorageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Password"
        passwordTextField.delegate = self
        // Dismiss keyboard when tap screen
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGes)
        eyeButton.setImage(UIImage(named: "eyeOffIcon"), for: .normal)
        eyeButton.setImage(UIImage(named: "eyeIcon"), for: .selected)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func showHidePassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    @IBAction func createPasswordBtnClick(_ sender: UIButton) {
        if viewModel.isValidPassword(password: passwordTextField.text ?? "") {
            errorLabel.text = ""
            viewModel.savePassword(user: User(password: passwordTextField.text ?? ""))
            let showPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.showPasswordViewController) as! ShowPasswordViewController
            self.navigationController?.pushViewController(showPasswordViewController, animated: true)
        } else {
            errorLabel.text = Constants.errorPasswordText
        }
    }
}

// MARK: UITextFieldDelegate
extension CreatePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
