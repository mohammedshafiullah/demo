//
//  SessionModel.swift
//  S4MAssignment1
//
//  Created by mohammed shafiullah on 26/10/17.
//  Copyright © 2017 mohammed shafiullah. All rights reserved.
//

import Foundation

class SessionModel: NSObject
{
    internal var SessionId = Int()
    internal var ActivityStartDate = String()
    internal var ActivityEndDate = String()
    internal var phoneNumber = String()
    internal var jobTitle = String()
    
    var allInviteeArray:[InviteeModel]!
    
    
    

    
    /**
     Default Constructor
     - returns: nil
     */
    override init()
    {
        
    }
    
    /**
     Mapping Response keys to variables
     - parameter map: Map
     */
    
}
