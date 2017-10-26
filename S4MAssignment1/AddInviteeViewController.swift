//
//  AddInviteeViewController.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 26/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class AddInviteeViewController: UIViewController {
    var allInviteeArray:[InviteeModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        startParsing()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startParsing()
    {
        let path: NSString = Bundle.main.path(forResource: "Addinvitees", ofType: "json")! as NSString
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSData.ReadingOptions.dataReadingMapped)
        
        //fetching the data from the url
        if let jsonObj = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary {
            // getting the avengers tag array from json and converting it to NSArray
            if let inviteesArray = jsonObj!.value(forKey: "invitees") as? NSArray {
                allInviteeArray = [InviteeModel]()
                var inviteeObj = InviteeModel()
                //looping through all the elements
                for invitee in inviteesArray {
                    inviteeObj = InviteeModel()
                    //converting the element to a dictionary
                    if let inviteeDict = invitee as? NSDictionary {
                        
                        //getting the name from the dictionary
                        if let id = inviteeDict.value(forKey: "id")
                        {
                            inviteeObj.id = id as! Int
                        }
                        if let name = inviteeDict.value(forKey: "name")
                        {
                            inviteeObj.name = name as! String
                        }
                        if let email = inviteeDict.value(forKey: "email")
                        {
                            inviteeObj.email = email as! String
                        }
                        if let phoneNumber = inviteeDict.value(forKey: "phoneNumber")
                        {
                            inviteeObj.phoneNumber = phoneNumber as! String
                        }
                        if let jobTitle = inviteeDict.value(forKey: "jobTitle")
                        {
                            inviteeObj.jobTitle = jobTitle as! String
                        }
                        allInviteeArray.append(inviteeObj)
                    }
                }
                print(allInviteeArray)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
