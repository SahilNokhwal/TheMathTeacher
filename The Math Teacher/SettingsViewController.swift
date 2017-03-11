//
//  SettingsViewController.swift
//  The Math Teacher
//
//  Created by Sahil Nokhwal on 2/15/16.
//  Copyright © 2016 Sahil Nokhwal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
 var mathTeacher:MathTeacher!
    override func viewDidLoad() {
        super.viewDidLoad()
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        mathTeacher = app.mathTeacher
      //  maxSizeTF.delegate = self
        plusButtonBTN.backgroundColor = UIColor.greenColor()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var plusButtonBTN: UIButton!

    @IBOutlet weak var minusButtonBTN: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var maxSizeTF: UITextField!

    func problemUpdate(){
        let update:Int? = Int(maxSizeTF.text!)
        if(update != nil){
            mathTeacher.maximumProblemSize = update!
        }
        
    }
    
    func textFieldShouldreturn(maxSizeTF:UITextField!)->Bool{
        maxSizeTF.resignFirstResponder()
        return true;
    }
    
    override func viewWillAppear(animated: Bool) {
        problemUpdate()
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        problemUpdate()
    }
    
    
    @IBAction func operateSC(sender: AnyObject) {
        
        let sortedViews = sender.subviews.sort( { $0.frame.origin.x < $1.frame.origin.x } )
        
        for (index, view) in sortedViews.enumerate() {
            if index == sender.selectedSegmentIndex {
                view.tintColor = UIColor.greenColor()
            } else {
                view.tintColor = UIColor.lightGrayColor()
            }
        }
        
        if  sender.selectedSegmentIndex == 0
        {
            mathTeacher.operation = .Plus
            
        }
        else
        {
            mathTeacher.operation = .Minus
            
        }
        
    }


//    override func viewWillDisappear(animated: Bool) {
//        
//        mathTeacher.maximumProblemSize = Int(maxSizeTF.text!)!
//    }
    
        
    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func plusBTN(sender: AnyObject) {
     //  var operation =
        
        mathTeacher.operation = .Plus
        
        plusButtonBTN.backgroundColor = UIColor.greenColor()
        
        minusButtonBTN.backgroundColor = UIColor.whiteColor()
    }
    
    
    @IBAction func minusBTN(sender: AnyObject) {
        
        mathTeacher.operation = .Minus
        
        plusButtonBTN.backgroundColor = UIColor.whiteColor()
        
        minusButtonBTN.backgroundColor = UIColor.greenColor()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
