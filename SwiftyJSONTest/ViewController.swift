//
//  ViewController.swift
//  SwiftyJSONTest
//

import UIKit

import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        parseSampleJson()
    }
    
    func parseSampleJson() {
        let st = NSDate()

        let file:NSString = Bundle.main.path(forResource: "testJson", ofType: "json")! as NSString
        let jsonData:NSData = NSData.dataWithContentsOfMappedFile(file as String) as! NSData
        let json = JSON(data: jsonData as Data)
        
        let dataJson = json["data"]
        for (_, subJson): (String, JSON) in dataJson {
//            NSLog("Name = " + subJson["Name"].stringValue)
            let castes = subJson["Castes"]
            for (_, cn): (String, JSON) in castes {
//                NSLog("  Name = " + cn["Name"].stringValue)
            }
        }
        let et = NSDate()
        let timeTaken = et.timeIntervalSince(st as Date)
        NSLog("******* Time taken = \(timeTaken)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

