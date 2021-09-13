//
//  ForgotVC.swift
//  RideShare
//
//  Created by Muhammad Usman on 02/06/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit
import Foundation


class ForgotVC: UIViewController {
    
    @IBOutlet weak var forgotTxtField: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
     @IBOutlet weak var forgotLbl: UILabel!
    @IBOutlet weak var forgotDetailLbl: UILabel!
    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtn.shadow()
    }
    
    
    
    //mARK:- action
    @IBAction func sendBtnTapped(_ sender: Any) {
         if forgotTxtField.text!.isEmpty {
            showSwiftMessageWithParams(theme: .info, title: "Reset Password", body: "please Enter your Email")
            forgotTxtField.becomeFirstResponder()
            sendBtn.shake()
            
         }
       //  else
//         {
//            let body :[String:Any] = [
//                "email": forgotTxtField.text!,
//            ]
//
//            passwordReset(param: body)
//
//        }
    }
    
    
//    private func passwordReset(param:[String:Any]) {
//        let email = forgotTxtField.text!
//        Alamofire.request("\(passwordResetUrl)\(email)", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            print(response)
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")// response serialization result
//            if response.response?.statusCode == 201 || response.response?.statusCode == 200 {
//                showSwiftMessageWithParams(theme: .success, title: "Reset Password", body: "Please accept the link send on your email")
//                print(response)
//                self.navigationController?.popViewController(animated: true)
//            }else {
//                showSwiftMessageWithParams(theme: .error, title: "Reset Password", body: "Something is not working")
//            }
//        }
//    }
    
//    func PasswordResetUrlSession() {
//
//        let body :[String:Any] = [
//
//            "email": forgotTxtField.text!
//        ]
//
//        let headers = [
//          "cache-control": "no-cache",
//          "Postman-Token": "408497f2-c57a-4cab-89ff-4463ff7cc470"
//        ]
//
//        let postData = NSData(data: "muhammadusman17982@gmail.com".data(using: String.Encoding.utf8)!)
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://www.myburaq.net/api/account/reset-password/init")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = postData as! Data
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//          if (error != nil) {
//            print(error)
//          } else {
//            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse)
//          }
//        })
//
//        dataTask.resume()
//    }
    
}





