//
//  LoginViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {


//Outlets
@IBOutlet weak var emailTextField: UITextField!
@IBOutlet weak var passwordTextField: UITextField!


    //Login Action
    @IBAction func loginAction(_ sender: AnyObject) {
        if self.emailTextField.text! == "" || self.passwordTextField.text! == "" {
            let alertControlller = UIAlertController(title: "error", message: "please enter email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertControlller.addAction(defaultAction)
            self.present(alertControlller, animated: true, completion: nil)
            
        }else{
            FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!) {
                (user,error) in
                if error == nil {
                    print("you are log in")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title: "error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
