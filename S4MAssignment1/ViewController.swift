//
//  ViewController.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cell : SessionTableViewCell!
    
    var allInviteeArray:[InviteeModel]!
    
    var sessionArray:[SessionModel]!

  var subject = ["Advanced Animations with UIKi Animations with UIKittAdvanced Animations with UIKi Animations with UIKitt","A Peek at 3D Touch","Architecting for Performance on watchOS 3 Performance on watchOS 3","Building Great Workout Apps","CloudKit Best Practices"]
    
    var location = ["Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai"]
    
    var startAndEndTime = ["3.00 - 4.00 PM","3.00 - 4.00 PM","3.00 - 4.00 PM","3.00 - 4.00 PM","3.00 - 4.00 PM"]
    
    var ownerName = ["Joshua Baker","Michael Caliman","Joshua Baker","Joshua Baker","Michael Caliman"]
    
    var accountNmae = ["Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation"]
    
    
    @IBOutlet var sessionTableObj: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        startParsing()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func startParsing()
        
    {
        let path: NSString = Bundle.main.path(forResource: "Session", ofType: "json")! as NSString
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSData.ReadingOptions.dataReadingMapped)
        
        //fetching the data from the url
        if let jsonObj = try? JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? NSDictionary {
            
            if let inviteesArray = jsonObj!.value(forKey: "Sessions") as? NSArray {
                
                sessionArray = [SessionModel]()
                
                //looping through all the elements
                for session in sessionArray {
                  var sessionObj = SessionModel()
                    
                    //converting the element to a dictionary
                    if let sessionDict = session as? NSDictionary {
                        
                        //getting the name from the dictionary
                        if let sessionId = sessionDict.value(forKey: "ActivityStartDate")
                        {
                            sessionObj.ActivityStartDate = sessionId as! String
                        }
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
                        sessionObj.allInviteeArray=allInviteeArray
                        
                         sessionArray.append(sessionObj)
                    }
                }
                print(sessionArray)
            }
            
//            // getting the avengers tag array from json and converting it to NSArray
//            if let inviteesArray = jsonObj!.value(forKey: "invitees") as? NSArray {
//                allInviteeArray = [InviteeModel]()
//                var inviteeObj = InviteeModel()
//                //looping through all the elements
//                for invitee in inviteesArray {
//                    inviteeObj = InviteeModel()
//                    //converting the element to a dictionary
//                    if let inviteeDict = invitee as? NSDictionary {
//
//                        //getting the name from the dictionary
//                        if let id = inviteeDict.value(forKey: "id")
//                        {
//                            inviteeObj.id = id as! Int
//                        }
//                        if let name = inviteeDict.value(forKey: "name")
//                        {
//                            inviteeObj.name = name as! String
//                        }
//                        if let email = inviteeDict.value(forKey: "email")
//                        {
//                            inviteeObj.email = email as! String
//                        }
//                        if let phoneNumber = inviteeDict.value(forKey: "phoneNumber")
//                        {
//                            inviteeObj.phoneNumber = phoneNumber as! String
//                        }
//                        if let jobTitle = inviteeDict.value(forKey: "jobTitle")
//                        {
//                            inviteeObj.jobTitle = jobTitle as! String
//                        }
//                        allInviteeArray.append(inviteeObj)
//                    }
//                }
//                print(allInviteeArray)
//            }
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableview delegate
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        return location.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
         cell  = tableView.dequeueReusableCell(withIdentifier: "IdentifierSessionVCCell") as! SessionTableViewCell
        
        if(cell == nil)
            
            
        {
            cell = Bundle.main.loadNibNamed("IdentifierSessionVCCell", owner: self, options: nil)?[0] as! SessionTableViewCell;
        }
                //////loading sessions information in listview/////
        cell.subjectLabelObj.text = self.subject[indexPath.row] as String
        cell.locationLabelObj.text=self.location[indexPath.row] as String
        cell.startAndEndDateLabelObj.text = self.startAndEndTime[indexPath.row] as String
        cell.ownerNameLabelObj.text=self.ownerName[indexPath.row] as String
        cell.accountNameLabelObj.text = self.accountNmae[indexPath.row] as String
        
     
        return cell as SessionTableViewCell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat
    {
        
        
        //        cell.cellHeightConstraint.constant = cell.subjectLabelHeightConstraint.constant+cell.ownerAndAccountViewHeightConstrint.constant+cell.startAndEndDateLabelHeightConstraint.constant+cell.locationLabelHeightConstraint.constant+cell.subjectLabelHeightConstraint.constant
        //
        // self.sessionTableObj.rowHeight = CGFloat(cell.cellHeightConstraint.constant)
        
        
        let font = UIFont(name: "Helvetica", size: 20.0)
        
        let text = subject[indexPath.row]
        
       let height = heightForView(text: text, font: font!, width:UIScreen.main.bounds.width )
        
        return height+400
        
        
    }

    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }

}

