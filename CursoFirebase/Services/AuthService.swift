//
//  AuthService.swift
//  CursoFirebase
//
//  Created by UNAM-Apple8 on 29/06/22.
//

import Foundation
import FirebaseAuth
import UIKit

struct AuthCredential
{
    var name : String
    var email : String
    var password : String
    var image : UIImage
}

struct AuthService
{
    static func authUser(withCredential credential : AuthCredential, completion : @escaping(Error?) -> Void)
    {
        ImageUploadService.uploadProfileImage(image: credential.image) { imagerUrl in
            
            Auth.auth().createUser(withEmail: credential.email, password: credential.password) { result, error in
                
                if let result = result, error == nil
                {
                    let uid = result.user.uid
                    
                    //darle persistencia a nuestro usuario
                    
                    UserService.save(uid: uid, imageUrl: imagerUrl, credential: credential)
                    
                } else {
                    print("DEBUG: - AuthUser: \(error!.localizedDescription)")
                }
            }
        }
    }
}

