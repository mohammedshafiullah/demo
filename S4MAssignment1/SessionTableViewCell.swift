//
//  SessionTableViewCell.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 25/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    
    //////outlet objects//////
    @IBOutlet var initialNmaeLabelObj: UILabel!
    @IBOutlet var accountNameLabelObj: UILabel!
    @IBOutlet var ownerNameLabelObj: UILabel!
    @IBOutlet var startAndEndDateLabelObj: UILabel!
    @IBOutlet var locationLabelObj: UILabel!
    @IBOutlet var subjectLabelObj: UILabel!
    @IBOutlet var onGoingUpcomingLabelObj: UILabel!
    @IBOutlet var ongoingSessionTimeLabelObj: UILabel!
    @IBOutlet var ongoingSessionMeridiamLabelObj: UILabel!
    
    
    //Programatical constrains for multi screen support//
    @IBOutlet var accountNameLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var ownerNameLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var ownerAndAccountViewHeightConstrint: NSLayoutConstraint!
    @IBOutlet var startAndEndDateLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var locationLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var subjectLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet var subLocStartEndDateViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var bothOwnerAndLocSuperViewHeightConstrint: NSLayoutConstraint!
    @IBOutlet var setnOwnerAndLocationSuperviewHeightConstrint: NSLayoutConstraint!
    @IBOutlet var cellHeightConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        accountNameLabelHeightConstraint.constant = 100
//       ownerAndAccountViewHeightConstrint.constant = 100
//        startAndEndDateLabelHeightConstraint.constant = 100
//        locationLabelHeightConstraint.constant = 100
//        subjectLabelHeightConstraint.constant = 100
//        
//       cellHeightConstraint.constant = 500
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
