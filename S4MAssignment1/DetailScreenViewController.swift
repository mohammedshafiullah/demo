//
//  DetailScreenViewController.swift
//  S4MAssignment1
//
//  Created by Developer on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController
{
    

    @IBOutlet var detailSessionTableViewObj: UITableView!
    
    
    @IBOutlet var detailScreenScrollViewObj: UIScrollView!
    
    @IBOutlet var inviteeTableViewObj: UITableView!
    @IBOutlet var detailScreenScrollViewsChildView: UIView!
    var inviteeBoolean = false
    
    @IBOutlet var headerTittleLabelObj: UILabel!
    var location = ["Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai","Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai","Marina 101, Dubai", "Princess Tower, Dubai","Elite Residence, Dubai","Address the BLVD, Dubai","Almas Tower, Dubai"]
    
    var accountNmae = ["Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation","Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation","Vision Corporation","Server Tech Lead","Vision Corporation","Server Tech Lead","Vision Corporation"]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        inviteeBoolean = false
        detailSessionTableViewObj.register(InviteesListTableViewCell.self, forCellReuseIdentifier: "CellIN")
        inviteeTableViewObj.register(DetailScreenTableViewCell.self, forCellReuseIdentifier: "CellD")


        // Do any additional setup after loading the view.
    }
   
    
    override func viewDidLayoutSubviews()
    {
      scrollViewContentSize ()
    }
    
        func scrollViewContentSize ()
    {
    
        detailScreenScrollViewObj.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 60)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let per:CGFloat = 60 //percentage of required view to move on while moving collection view
        let deductValue = CGFloat(per / 100 * detailScreenScrollViewObj.frame.size.height)
        let offset = (-(per/100)) * (scrollView.contentOffset.y)
        let value = offset - deductValue
        self.detailScreenScrollViewObj.contentOffset = CGPoint(dictionaryRepresentation: value as! CFDictionary)!
    }
    
    @IBAction func inviteeButtonAction(_ sender: UIButton) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //IdnfrInviteesCell
  //  IdnfrDetailSessionCell
    
    //tableview delegate
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //make sure you use the relevant array sizes
        
        if (inviteeBoolean)
        {
        return location.count
        }
        else
        {
            return accountNmae.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        if (inviteeBoolean)
        {
            var inviteeCell : InviteesListTableViewCell! =  tableView.dequeueReusableCell(withIdentifier: "CellIN", for:indexPath) as! InviteesListTableViewCell

           if(inviteeCell == nil)
            {
                inviteeCell = Bundle.main.loadNibNamed("CellIN", owner: self, options: nil)?[0] as! InviteesListTableViewCell;
            }
            return inviteeCell as InviteesListTableViewCell
        }
        else
        {
             var detailScnCell : DetailScreenTableViewCell! =  tableView.dequeueReusableCell(withIdentifier: "CellD", for:indexPath) as! DetailScreenTableViewCell
            
            if(detailScnCell == nil)
            {
                detailScnCell = Bundle.main.loadNibNamed("CellD", owner: self, options: nil)?[0] as! DetailScreenTableViewCell;
            }
            return detailScnCell as DetailScreenTableViewCell

        }
        
    }
    
    
    @IBAction func addInviteeAction(_ sender: UIButton)
    {
        
    }
    
    @IBAction func editButtonAction(_ sender: UIButton) {
        inviteeBoolean = true
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
    }
}
