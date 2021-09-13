//
//  signupVC.swift
//  RideShare
//
//  Created by Muhammad Usman on 01/06/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class signupVC: UIViewController {
    
    //MArk:- Outlets
    @IBOutlet weak var userNameTxtField: UITextField!
    
    @IBOutlet weak var enterEmailTxtField: UITextField!
    @IBOutlet weak var PassTxtField: UITextField!
    @IBOutlet weak var confirmPassTxtField: UITextField!
    @IBOutlet weak var sighupBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!

    
    //Mark:- variable and properties
    var iconClicked = true
    let defaults = UserDefaults.standard
    
    //Mark:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sighupBtn.shadow()
    }
    
    
   
    @IBAction func passwordHideTapped(_ sender: UIButton) {
        if(iconClicked == true) {
            PassTxtField.isSecureTextEntry = false
            sender.setImage(#imageLiteral(resourceName: "unhide"), for: .normal)
        } else {
            PassTxtField.isSecureTextEntry = true
            sender.setImage(#imageLiteral(resourceName: "hide"), for: .normal)
        }
        
        iconClicked = !iconClicked
    }
    @IBAction func unhidepassTapped(_ sender: UIButton) {
        if(iconClicked == true) {
            confirmPassTxtField.isSecureTextEntry = false
            sender.setImage(#imageLiteral(resourceName: "unhide"), for: .normal)
        } else {
            confirmPassTxtField.isSecureTextEntry = true
            sender.setImage(#imageLiteral(resourceName: "hide"), for: .normal)
        }
        
        iconClicked = !iconClicked
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        if userNameTxtField.text!.isEmpty{
            showSwiftMessageWithParams(theme: .info, title: "SignUp", body: "Please Enter username ")
            
        }else if enterEmailTxtField.text!.isEmpty {
            showSwiftMessageWithParams(theme: .info, title: "SignUp", body: "please Enter your Email")
            
        }else if PassTxtField.text!.isEmpty{
            showSwiftMessageWithParams(theme: .info, title: "SignUp ", body: "Please Enter your password")
            
        }else if confirmPassTxtField.text!.isEmpty {
            
            showSwiftMessageWithParams(theme: .info, title: "SignUp", body: "please confirm your password")
            
        }else if PassTxtField.text != confirmPassTxtField.text! {
            
        }
        else
        {
//            let body :[String:Any] = [
//                "login": userNameTxtField.text!,
//                "firstName": fNametextField.text!,
//                "lastName": LnameTxtField.text!,
//                "email": enterEmailTxtField.text!,
//                "password": PassTxtField.text!,
//                "langKey": "en"
//            ]
//
//            print(body)
//            signupApiCall(param: body)
            
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    private func signupApiCall(param:[String:Any]) {
//        Alamofire.request(signupUrl, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            print(response)
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")// response serialization result
//            if response.response?.statusCode == 201 {
//                showSwiftMessageWithParams(theme: .success, title: "Sign up", body: "Please accept the link send on your email")
//                print(response)
//                self.navigationController?.popViewController(animated: true)
//            }else {
//                showSwiftMessageWithParams(theme: .error, title: "SignUp", body: "email already exist")
//            }
//        }
//    }
    
}
