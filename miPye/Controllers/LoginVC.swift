//
//  LoginVC.swift
//  RideShare
//
//  Created by Muhammad Usman on 02/06/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var selectLanguageBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var forgotBtn: UIButton!
    //MARK:- Outlets and Properties
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    //MARK:- Variables and Constents
    var iconClick = true
    
    //MARK:- View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.shadow()
    }
    
    //MARK:- Actions.
    @IBAction func hidPasswordTapped (_ sender: UIButton ){
      if(iconClick == true) {
        passTxtField.isSecureTextEntry = false
        sender.setImage(#imageLiteral(resourceName: "unhide"), for: .normal)
      } else {
        passTxtField.isSecureTextEntry = true
        sender.setImage(#imageLiteral(resourceName: "hide"), for: .normal)
      }
      
      iconClick = !iconClick
    }
    
    
    @IBAction func forgotTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ForgotVC") as! ForgotVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func LoginTapped(_ sender: Any) {
        
        if userNameTxtField.text!.isEmpty{
            showSwiftMessageWithParams(theme: .info, title: "Login", body: "Please Enter The username Field")
            
        }else if passTxtField.text!.isEmpty {
            showSwiftMessageWithParams(theme: .info, title: "Login", body: "Please Enter the password fields")
            
        }else {
            
            let SB = UIStoryboard(name: "Main", bundle: nil)
                           let VC = SB.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                           let appDelegate = UIApplication.shared.delegate as! AppDelegate
                           appDelegate.window?.rootViewController = VC
                           showSwiftMessageWithParams(theme: .success, title: "miPye", body: "Succefully Login")
//            let deviceToken = UserDefaults.standard.string(forKey: SessionManager.Shared.deviceToken) ?? ""
//            let body :[String:Any] = [
//                "username":userNameTxtField.text!,
//                "password":passTxtField.text!,
//                "rememberMe":"false",
//                "firebaseToken":deviceToken,
//                "os":"IOS"
//            ]
//            UserDefaults.standard.set(userNameTxtField.text, forKey: SessionManager.Shared.email)
//            UserDefaults.standard.set(passTxtField.text, forKey: SessionManager.Shared.password)
//
//            print(body)
//            loginApiCall(param: body)
            
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "signupVC") as! signupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:- Private Functions
//    private func loginApiCall(param:[String:Any]) {
//        Alamofire.request(loginUrl, method: .post, parameters: param, encoding:
//            JSONEncoding.default, headers: nil).responseJSON { (response) in
//                print(response)
//             //   print(response.response?.statusCode)
//            if response.result.error == nil {
//                if response.response?.statusCode == 200 {
//                     guard let data = response.data else {return}
//
//                     do{
//
//                         if let jsonDic = try JSON (data: data).dictionary {
//                             let token = jsonDic["id_token"]?.string ?? ""
//                             UserDefaults.standard.set(token, forKey: SessionManager.Shared.token)
//                             // Show Home
//                            self.getAccount()
//                         }
//
//                     }catch let jsonErr{
//                         print(jsonErr)
//                         showSwiftMessageWithParams(theme: .info, title: "SignUp", body: jsonErr.localizedDescription)
//                     }
//
//                }else {
//                    showSwiftMessageWithParams(theme: .error, title: "Login", body: "Please Enter the right credential")
//                }
//            } else {
//                print(response.result.error?.localizedDescription as Any)
//            }
//        }
//    }
    
//    private func getAccount(){
//        Networking.instance.getProfile(url: accountUrl) { (response, err, statusCode) in
//            if statusCode == 200 {
//                guard let jsonDict = response.dictionary else {return}
//                let login = jsonDict["login"]?.string ?? ""
//                let firstName = jsonDict["firstName"]?.string ?? ""
//                let email = jsonDict["email"]?.string ?? ""
//                let langKey = jsonDict["langKey"]?.string ?? ""
//                let createdDate = jsonDict["createdDate"]?.string ?? ""
//                let idd = jsonDict["id"]?.int ?? -1
//                let lastName = jsonDict["lastName"]?.string ?? ""
//                let imageUrl = jsonDict["imageUrl"]?.string ?? ""
//                let activatedStatus = jsonDict["activated"]?.bool ?? false
//                self.Account = AcoountModel.init(login: login,firstName: firstName, email: email, langKey: langKey, createdDate: createdDate, id: idd, lastName: lastName, imageUrl: imageUrl, activatedStatus: activatedStatus)
//
//                UserDefaults.standard.set(idd, forKey: SessionManager.Shared.userId)
//                let SB = UIStoryboard(name: "Main", bundle: nil)
//                let VC = SB.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.window?.rootViewController = VC
//                showSwiftMessageWithParams(theme: .success, title: strLogin, body: strSucessLogin)
//            }
//
//        }
//    }
    
}
