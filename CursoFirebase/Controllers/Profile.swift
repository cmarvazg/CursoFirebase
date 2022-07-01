//
//  Profile.swift
//  CursoFirebase
//
//  Created by UNAM-Apple8 on 29/06/22.
//

import UIKit

class Profile: UIViewController {

    @IBOutlet weak var imgProfileImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var bottonCloseSession: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView()
        // Do any additional setup after loading the view.
    }
    
    
    func settingView(){
        UserService.getUser { User in
            
            self.lblName.text = User.name
            self.lblEmail.text = User.email
            
            if let imageData = try? Data(contentsOf: URL(string: User.image)!){
                
                self.imgProfileImage.image = UIImage(data: imageData)
            }
        }
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
