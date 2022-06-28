//
//  MeetingItem+CoreDataProperties.swift
//  Core Spotlight
//
//  Created by Pranav Badgi on 6/28/22.
//
//

import Foundation
import CoreData


extension MeetingItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeetingItem> {
        return NSFetchRequest<MeetingItem>(entityName: "MeetingItem")
    }

    @NSManaged public var meetingName: String?
    @NSManaged public var hostedBy: String?
    @NSManaged public var dateAndTime: String?

}

extension MeetingItem : Identifiable {

}
