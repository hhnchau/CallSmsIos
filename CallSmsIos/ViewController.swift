//
//  ViewController.swift
//  CallSmsIos
//
//  Created by Kingpes on 8/12/18.
//  Copyright © 2018 Kingpes. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    @IBOutlet weak var edtPhone: UITextField!
    @IBOutlet weak var edtMessage: UITextView!
    @IBAction func btnCall(_ sender: Any) {
        if let phoneUrl:NSURL = NSURL(string: "tel://\(edtPhone.text!)"){
            let app:UIApplication = UIApplication.shared
            if app.canOpenURL(phoneUrl as URL){
                app.open(phoneUrl as URL, options: [:], completionHandler: nil)
            }
        }
    }
    @IBAction func btnSms(_ sender: Any) {
        let sms = MFMessageComposeViewController()
        sms.body = edtMessage.text!
        sms.recipients = ["\(edtPhone.text!)"]
        self.present(sms, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

