//
//  LoginViewController.swift
//  IP-Conduit
//
//  Created by Nicolas Schmidt on 10/2/17.
//  Copyright © 2017 408 Industries. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin_TouchUpInside(_ sender: Any) {
        // TODO: Perform some input validation
        
        if let email = txtEmail.text, let password = txtPassword.text {
            
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                
                // Sign in successful -> Go to homepage
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePage")
                    self.present(vc!, animated: true, completion: nil)
                    
                }
                    // Sign in failed -> Show error message
                else{
                    let alertController = UIAlertController(title: "Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result: UIAlertAction) -> Void in
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
