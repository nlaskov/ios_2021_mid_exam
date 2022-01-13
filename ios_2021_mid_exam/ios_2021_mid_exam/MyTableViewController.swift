//
//  MyTableViewController.swift
//  ios_2021_mid_exam
//
//  Created by Nikola Laskov on 13.01.22.
//

import UIKit
class MyTableViewController: UIViewController {
    
    var selected: Event? = nil
    var DataBase: Model = Model();
    
    @IBOutlet weak var TableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        TableView.dataSource = self

    }
}

extension MyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataBase.month.events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = DataBase.month.events[indexPath.row]
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        if let myCell = cell as? MyTableViewCell {
            myCell.Title.text = data.title
            myCell.Notes.text = data.notes
            myCell.Date.text = data.date
            myCell.Time.text = String(data.time)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let event = segue.destination as! EventInfoViewController
        event.selectedEvent = selected!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = DataBase.month.events[indexPath.row]
            self.performSegue(withIdentifier: "EventDetail", sender: self)
        }
    
    
}

class MyTableViewCell: UITableViewCell{
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Notes: UILabel!
    @IBOutlet weak var Time: UILabel!
}
