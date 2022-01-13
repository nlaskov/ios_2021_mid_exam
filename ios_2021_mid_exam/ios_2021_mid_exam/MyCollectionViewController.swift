//
//  MyCollectionViewController.swift
//  ios_2021_mid_exam
//
//  Created by Nikola Laskov on 13.01.22.
//

import UIKit

class MyCollectionViewController:UIViewController{
    var DataBase:Model = Model();
    
    @IBOutlet weak var CollectionView:UICollectionView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        CollectionView.dataSource = self
    }
}

extension MyCollectionViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataBase.month.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = DataBase.month.events[indexPath.row]
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath)
        
        if let myCell = cell as? MyCollectionViewCell {
            myCell.Title.text = data.title
            myCell.Notes.text = data.notes
            myCell.Date.text = data.date
            myCell.Time.text = String(data.time)
        }
        
        return cell
    }
    
}

class MyCollectionViewCell:UICollectionViewCell{
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Notes: UILabel!
    @IBOutlet weak var Time: UILabel!
}
