//
//  LoginViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 04/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var frontLogoImageView: UIImageView!
    @IBOutlet weak var backLogoImageView: UIImageView!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginUsernameTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!

    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signUpUsernameTextField: UITextField!
    @IBOutlet weak var signUpPasswordTextField: UITextField!
    @IBOutlet weak var signUpConfirmPasswordTextField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginUsernameTextField.text = ""
        loginPasswordTextField.text = ""
        signUpUsernameTextField.text = ""
        signUpPasswordTextField.text = ""
        signUpConfirmPasswordTextField.text = ""

        if UserCenter.current != nil {
            loginButtonTapped(self)
        } else {
            signUpButtonTapped(self)
        }
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        loginButton.setTitleColor(.black, for: .normal)
        signUpButton.setTitleColor(.gray, for: .normal)

        loginView.isHidden = false
        signUpView.isHidden = true
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        loginButton.setTitleColor(.gray, for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)

        loginView.isHidden = true
        signUpView.isHidden = false
    }

    @IBAction func goDrinkButtonTapped(_ sender: Any) {
        loginUsernameTextField.resignFirstResponder()
        loginPasswordTextField.resignFirstResponder()
        guard let user = UserCenter.current,
            user.username == loginUsernameTextField.text,
            user.password == loginPasswordTextField.text else {
            navigationController?.presentAlert(title: "Wrong", message: "Incorrect details provided.", button: "Ok")
            return
        }

        navigationController?.loadAndPushViewController(UIStoryboard.homeViewController)
    }
    
    @IBAction func iWantToDrinkButtonTapped(_ sender: Any) {
        signUpUsernameTextField.resignFirstResponder()
        signUpPasswordTextField.resignFirstResponder()
        signUpConfirmPasswordTextField.resignFirstResponder()
        guard let username = signUpUsernameTextField.text,
            let password = signUpPasswordTextField.text,
            password == signUpConfirmPasswordTextField.text else {
                navigationController?.presentAlert(title: "Something Is Wrong!", message: "Please ensure the passwords are equal.", button: "Ok")
                return
        }

        let agreementViewController = UIStoryboard.agreementViewController
        agreementViewController.username = username
        agreementViewController.password = password
        navigationController?.loadAndPushViewController(agreementViewController)
    }
}
