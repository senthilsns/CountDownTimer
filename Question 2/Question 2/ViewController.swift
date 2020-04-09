//
//  ViewController.swift
//
//  Created by Senthil on 09/04/20.
//  Copyright © 2020 Senthil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TimerTxtFld: UITextField!
    
    var counter = 0

    @IBAction func CountDownBtn_TouchUpInside(_ sender: Any) {
        
        
        if TimerTxtFld.text?.isEmpty ?? true {
                         
                         let alert = UIAlertController(title: "Please Enter Valid Number", message: nil,         preferredStyle: UIAlertController.Style.alert)
                         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
                                 //OK Action
                             }))
                         self.present(alert, animated: true, completion: nil)
                         
        }else{
        
        counter = Int(TimerTxtFld.text!) ?? 0
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }

    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print("\(counter) seconds to Down")
            
            TimerTxtFld.text = String(counter)
            
            // Timer always shows end 1 so need to remove 1
            if  TimerTxtFld.text == "1" {
                TimerTxtFld.text = ""
            }
            
            counter -= 1
        }
    }
}

