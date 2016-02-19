//
//  ViewController.swift
//  Travel_Agency
//
//  Created by MobileApp on 2/5/16.
//  Copyright © 2016 MobileApp. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundView = UIImageView(image: UIImage(named: "a"));
        // Do any additional setup after loading the view, typically from a nib.
        
        NSUserDefaultsManager.initializeDefaults()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.alpha = 0.5
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaceManager.places.count
    }
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        navigationController?.navigationBar.alpha = 0.5
//    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell") as! customCell;
        if(indexPath.item % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            
        }
        cell.textLabel?.textColor = UIColor.blackColor()
        let place = PlaceManager.places[indexPath.item]
        cell.textLabel?.text = place.title
        cell.place = place
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            PlaceManager.deletePlace(indexPath.item)
            tableView.deleteRowsAtIndexPaths( [indexPath] , withRowAnimation: .Fade)
        }
        tableView .reloadData()
        return
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailSegue"){
            let cell = sender as! customCell
            let detailView = segue.destinationViewController as! DetailViewController
            detailView.placetitle = cell.place
        }
    }

}

