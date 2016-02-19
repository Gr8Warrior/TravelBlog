//
//  AddTouristPlaceViewController.swift
//  Travel_Agency
//
//  Created by MobileApp on 2/5/16.
//  Copyright © 2016 MobileApp. All rights reserved.
//

import UIKit

class AddTouristPlaceViewController: UIViewController {

    
    @IBOutlet var doneButton: UIBarButtonItem!
    
    @IBOutlet var placeDescription: UITextView!
    @IBOutlet var addPlace: UIButton!
    @IBOutlet var saveToiCloud: UIButton!
    @IBOutlet var placeName: UITextField!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlace.enabled = false
        placeDescription.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        placeName.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        // Do any additional setup after loading the view.
        
        //Important Learning for notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "placeNameDidChange", name: UITextFieldTextDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "placeDescriptionDidChange", name: UITextViewTextDidChangeNotification, object: nil)

    }
    func placeNameDidChange(){
        handleDoneButtonStates()
    }
    func placeDescriptionDidChange(){
        handleDoneButtonStates()
    }
    
    func handleDoneButtonStates(){
        //handle Done Button
        if(placeDescription.text != "") {
           doneButton.enabled = true
        } else {
            doneButton.tintColor = UIColor.clearColor()
            doneButton.enabled = false
        }
        if(placeName.text != "" && placeDescription.text != "") {
            addPlace.enabled = true
            addPlace.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        }else {
            addPlace.enabled = false
            addPlace.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
    }
    @IBAction func titleEnd_keyboard(sender: AnyObject) {
        placeName.resignFirstResponder()
    }
    
    @IBAction func doneButtonClick_ExitKeyboard(sender: AnyObject) {
        placeDescription.resignFirstResponder()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.alpha = 0.5
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addButtonClick(sender: AnyObject) {
        activityIndicator.startAnimating()
        PlaceManager.addPlace(placeName.text!,content:  placeDescription.text);
        
        NSUserDefaultsManager.synchronize()
        placeName.text = ""
        placeDescription.text = ""
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_MSEC)))
        dispatch_after(time, dispatch_get_main_queue(), {
            self.activityIndicator.stopAnimating()
            
        })
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
