//
//  ViewController.swift
//  CursoFirebase
//
//  Created by UNAM FCA 18 on 16/06/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func singIn(_ sender: Any) {
        
        if let email = txtEmail.text,
           let password = txtPassword.text{
            if !(email.isEmpty || password.isEmpty){
                
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    
                    if let result = result, error == nil{
                        self.performSegue(withIdentifier: "login", sender: nil)
                    }
                }
            }
        }
        
    }
    
    @IBAction func unwindToLogin(_ sender : UIStoryboardSegue){
        txtEmail.text = ""
        txtPassword.text = ""
        
    }
    
    
}

