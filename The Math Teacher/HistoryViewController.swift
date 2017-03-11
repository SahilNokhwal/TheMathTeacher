//
//  SecondViewController.swift
//  The Math Teacher
//
//  Created by Sahil Nokhwal on 2/15/16.
//  Copyright © 2016 Sahil Nokhwal. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
 var mathTeacher:MathTeacher?
    
   // @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
       
        mathTeacher = app.mathTeacher
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var HistoryTV: UITextView!

    override func viewWillAppear(animated: Bool)  {
        HistoryTV.text = mathTeacher!.history
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

