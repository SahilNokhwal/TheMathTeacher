//
//  FirstViewController.swift
//  The Math Teacher
//
//  Created by Sahil Nokhwal on 2/15/16.
//  Copyright © 2016 Sahil Nokhwal. All rights reserved.
//

import UIKit

class ProblemsViewController: UIViewController {

    var mathTeacher:MathTeacher?
    
    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var operand1LB: UILabel!
    
    @IBOutlet weak var operand2LB: UILabel!
    
    @IBOutlet weak var operationLB: UILabel!
    @IBAction func checkAnswer(sender: UIButton) {
        let textboxText:Int? = Int(text.text!)
        
        if textboxText != nil {
        
        
        let isBool:Bool =  (mathTeacher?.answerIsCorrect(textboxText!))!
        
        if isBool{
            
            displayAlertControllerWithTitle("Success", message: "Got it!")
        }else {
             displayAlertControllerWithTitle("Fail", message: "Nice try")
        }
        }else{
            displayAlertControllerWithTitle("Invalid Input", message: "Please enter some int value")
        }
        
    }
    
    
    
    @IBAction func makeNewProblem(sender: UIButton) {
        
        
        mathTeacher!.makeNewProblem()
        
        operand1LB.text = String(mathTeacher!.operand1)
        operand2LB.text = String(mathTeacher!.operand2)
        
        
        operationLB.text = mathTeacher?.operation.rawValue
        
        
        
        
        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   let app = UIApplication.sharedApplication().delegate as! AppDelegate
        mathTeacher = app.mathTeacher
        
        
        operand1LB.text = String(mathTeacher!.operand1)
        operand2LB.text = String(mathTeacher!.operand2)
        operationLB.text = mathTeacher!.operation.rawValue

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This method displays an alert controller
    // title: a String to be displayed at the top of the alert controller
    //
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }

}

