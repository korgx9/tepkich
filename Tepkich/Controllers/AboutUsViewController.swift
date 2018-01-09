//
//  AboutUsViewController.swift
//  Tepkich
//
//  Created by Kesh Pola on 1/4/18.
//  Copyright © 2018 Kesh Pola. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    private let firstManagerEmail = "koshoevbolot@gmail.com"
    private let secondManagerEmail = "iskender.esenbaev@gmail.com"
    private let firstManagerPhone = "+996555555999"
    private let secondManagerPhone = "+996551900999"
    private let chooseContactText = NSLocalizedString("Выберите", comment: "Alert action title")
    private let callActionTitle = NSLocalizedString("Позвонить", comment: "Alert action call")
    private let whatsUpActionTitle = NSLocalizedString("Написать в WhatsUp", comment: "Alert action whatsup")
    private let messageActionTitle = NSLocalizedString("Написать смс", comment: "Alert action sms")
    private let cancelActionTitle = NSLocalizedString("Отмена", comment: "Alert action cancel")
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func firstManagerPhoneButtonTapped(_ sender: Any) {
        openActionController(phone: firstManagerPhone)
    }
    
    @IBAction func firstManagerEmailButtonTapped(_ sender: Any) {
        open(scheme: "mailto:\(firstManagerEmail)")
    }
    
    @IBAction func secondManagerPhoneButtonTapped(_ sender: Any) {
        openActionController(phone: secondManagerPhone)
    }
    
    @IBAction func secondManagerEmailButtonTapped(_ sender: Any) {
        open(scheme: "mailto:\(secondManagerEmail)")
    }
    
    func openActionController(phone: String) {
        let alert = UIAlertController(title: nil, message: chooseContactText, preferredStyle: .actionSheet)
        
        let callAction = UIAlertAction(title: callActionTitle, style: .default , handler: { [unowned self] action in
            let call = "tel://\(phone)"
            self.open(scheme: call)
        })
        
        let whatsAppAction = UIAlertAction(title: whatsUpActionTitle, style: .default , handler: {action in
            let whatsup = "whatsapp://send?abid=\(phone)"
            self.open(scheme: whatsup)
        })
        
        let messageAction = UIAlertAction(title: messageActionTitle, style: .default , handler: { [unowned self] action in
            let sms = "sms://\(phone)"
            self.open(scheme: sms)
        })
        
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: nil)
        
        alert.addAction(callAction)
        alert.addAction(whatsAppAction)
        alert.addAction(messageAction)
        alert.addAction(cancelAction)

        navigationController?.present(alert, animated: true, completion: nil)
    }
 
    func open(scheme: String) {
        if let url = URL(string: scheme) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                                            print("Open \(scheme): \(success)")
                })
            }
            else {
                let success = UIApplication.shared.openURL(url)
                print("Open \(scheme): \(success)")
            }
        }
    }
}
