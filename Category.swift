//
//  Category.swift
//  
//
//  Created by Urmila Sampathkumar on 6/17/15.
//
//

import Foundation
import CoreData

class Category: NSManagedObject {

    @NSManaged var categoryId: String
    @NSManaged var categoryName: String
    @NSManaged var categoryToTasks: NSSet

}
