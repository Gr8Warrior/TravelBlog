//
//  DetailViewController.swift
//  Travel_Agency
//
//  Created by MobileApp on 2/5/16.
//  Copyright © 2016 MobileApp. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var placeContent: UITextView!
    
    var placetitle: Place?
    @IBOutlet var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
placeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.title = placetitle?.title
        self.title = placetitle?.title
        name.text = placetitle?.title
        placeContent.text = placetitle?.content
        navigationController?.navigationBar.alpha = 0.5
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
