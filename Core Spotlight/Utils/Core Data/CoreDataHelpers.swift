//
//  CoreDataHelpers.swift
//  Core Spotlight
//
//  Created by Pranav Badgi on 6/28/22.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHelpers {
    
    //MARK: - Properties
    static let shared = CoreDataHelpers()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    //MARK: - Helpers
    
    func getAllMeetings() -> [MeetingItem] {
        do {
            print("DEBUG: Getting All Meetings!")
            let meetings = try context.fetch(MeetingItem.fetchRequest())
            return meetings
        } catch {
            print("DEBUG: Handle Error")
        }
        return []
    }
    
    
    
    
    
    
    func createMeeting(meeting: Meeting, completion: @escaping (Bool) -> Void) {
        let newMeeting          = MeetingItem(context: context)
        newMeeting.meetingName  = meeting.meetingName
        newMeeting.hostedBy     = meeting.hostedBy
        newMeeting.dateAndTime  = meeting.dateAndTime
        do {
            print("DEBUG: Meeting Created Successfully")
            try context.save()
            completion(true)
        } catch {
            print("DEBUG: Handle Error")
            completion(false)
        }
        
    }
    
    
    
    
    
    
    func deleteMeeting(meeting: MeetingItem, completion: @escaping (Bool) -> Void) {
        context.delete(meeting)
        do {
            print("DEBUG: Meeting Deleted Successfully")
            try context.save()
            completion(true)
        } catch {
            completion(false)
            print("DEBUG: Handle Error")
        }
    }
    
    
    
    func updateMeeting(meetingItem: MeetingItem, meeting: Meeting) {
        meetingItem.meetingName     = meeting.meetingName
        meetingItem.hostedBy        = meeting.hostedBy
        meetingItem.dateAndTime     = meeting.dateAndTime
        do {
            print("DEBUG: Updated Meeting")
            try context.save()
        } catch {
            print("DEBUG: Handle Error")
        }
    }
    
    
    
    
    
    
}
