//
//  UserDetails.swift
//  LeqnAppAgain
//
//  Created by Urmila Sampathkumar on 6/8/15.
//  Copyright (c) 2015 Urmila Sampathkumar. All rights reserved.
//

import Foundation

class UserDetails
{
    var userFirstname: String!
    var userLastName: String!
    var role: String!
    var mgrFirstname: String!
    var mgrLastname: String!
    var city: String!
    var building: String!
    var floor: String!
    
    
    init(userFirstname: String, userLastName: String,role: String,mgrFirstname: String,mgrLastname: String,city: String,building: String, floor: String) {
        self.userFirstname = userFirstname;
        self.userLastName = userLastName;
        self.role = role;
        self.mgrFirstname = mgrFirstname;
        self.mgrLastname = mgrLastname;
        self.city = city;
        self.building = building;
        self.floor = floor;
    }
}
