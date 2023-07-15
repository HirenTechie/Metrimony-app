//
//  search_resultViewController.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 23/11/22.
//

import UIKit

class searchresultViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var pro : [profile] = []
    var se : search = search()
    var ps : profile = profile()
    var cast : [Caste] = []
    @IBOutlet weak var searchtable: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        loaddata()
    }
    func loaddata()
    {
        searchtable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pro.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : searchreasultTableViewCell = tableView.dequeueReusableCell(withIdentifier: "search", for: indexPath) as! searchreasultTableViewCell
        let p : profile = pro[indexPath.row]
        cell.s_name.text = p.Name
        if p.Gender == "Male"
        {
            cell.s_image.image = UIImage(named: "boy")
        }
        else
        {
            cell.s_image.image = UIImage(named: "girl")
        }
        if p.IsFevourite == 1
        {
            cell.heart.image = UIImage(named: "heart-f")
        }
        else
        {
            cell.heart.image = UIImage(named: "heart-e")
        }
        cell.s_age_address.text = "\(p.Age)Yrs, \(p.Height)"
        cell.s_cast_address.text = "\(p.Cast) ~ \(p.City), \(p.State)"
        return cell
    }
    
    

    
}
