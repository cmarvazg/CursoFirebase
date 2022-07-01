//
//  SingUp.swift
//  CursoFirebase
//
//  Created by UNAM-Apple8 on 29/06/22.
//

import UIKit

class SingUp: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var buttonSignUp: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    var didSelectedImage = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        


    }
    
    @IBAction func buttonSignUp(_ sender: Any) {
        if let name = txtName.text,
           let email = txtEmail.text,
           let password = txtPassword.text,
           let confirmPassword = txtConfirmPassword.text{
            
            if !(name.isEmpty || email.isEmpty || password.isEmpty || !didSelectedImage){
                
                if password == confirmPassword{
                    
                    let credential = AuthCredential(name: name, email: email, password: password, image: imgProfile.image!)
                    
                    AuthService.authUser(withCredential: credential) { error in
                        
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                    self.navigationController?.popViewController(animated: true)
                } else {
                    
                    print ("Las contraseñas no coinciden")
                }
            } else {
                print("Falto llenar un campo")
            }
            
        }
    }
    
    @IBAction func buttonSelectImage(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Choose a source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
            }
            alertController.addAction(photoLibraryAction)
        }
        alertController.popoverPresentationController?.sourceView = sender
        self.present(alertController, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        
        imgProfile.image = selectedImage
        
        didSelectedImage = true
        
        self.dismiss(animated: true)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
