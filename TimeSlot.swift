//
//  TimeSlot.swift
//  
//
//  Created by Urmila Sampathkumar on 6/17/15.
//
//

import Foundation
import CoreData

class TimeSlot: NSManagedObject {

    @NSManaged var isLogged: NSNumber
    @NSManaged var slotToCategory: NSOrderedSet

}
