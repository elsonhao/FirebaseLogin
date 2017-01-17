//
//  ResetPasswordViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var emailTextField: UITextField!

    // Reset Password Action
    @IBAction func submitAction(_ sender: AnyObject)
    {

        if self.emailTextField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
                
                var title2 = ""
                var message2 = ""
                
                if error != nil {
                    title2 = "Error!"
                    message2 = (error?.localizedDescription)!
                    
                    print("error")
                    

                } else {
                    print("good")
                    title2 = "Success!"
                    message2 = "Password reset email sent."
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: title2, message: message2, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            })
        }
    }
}
