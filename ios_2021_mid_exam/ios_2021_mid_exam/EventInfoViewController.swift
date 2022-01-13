//
//  EventInfoViewController.swift
//  ios_2021_mid_exam
//
//  Created by Nikola Laskov on 13.01.22.
//

import UIKit

class EventInfoViewController: UIViewController {

    @IBOutlet weak var EventTitle: UILabel!
    @IBOutlet weak var EventTime: UILabel!
    @IBOutlet weak var EventDate: UILabel!
    @IBOutlet weak var EventNote: UILabel!
    
    var selectedEvent: Event? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EventTitle.text=selectedEvent?.title;
        //EventTime.text=String(selectedEvent?.time);
        EventDate.text=selectedEvent?.date;
        EventNote.text=selectedEvent?.notes;
        
    }
   
}
