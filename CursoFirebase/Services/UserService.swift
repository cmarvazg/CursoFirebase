//
//  UserService.swift
//  CursoFirebase
//
//  Created by UNAM-Apple8 on 29/06/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct UserService
{
    static func save(uid : String, imageUrl : String, credential : AuthCredential)
    {
        Firestore.firestore().collection("users").document(uid).setData([
        
            "name" : credential.name,
            "email" : credential.email,
            "image" : imageUrl,
        ])
    }
    
    static  func getUser(completion : @escaping(User) -> Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { document, error in
            
            guard let userData = document?.data() else { return }
            
            let user = User(withDictionary: userData)
            
            completion(user)
        }
    }
}
