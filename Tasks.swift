//
//  Tasks.swift
//  
//
//  Created by Urmila Sampathkumar on 6/17/15.
//
//

import Foundation
import CoreData

class Tasks: NSManagedObject {

    @NSManaged var taskId: String
    @NSManaged var taskName: String
    @NSManaged var tasksToCategory: Category

}
