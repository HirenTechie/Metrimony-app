//
//  FavouriteViewController.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 21/11/22.
//

import UIKit



class FavouriteViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var favour:[profile] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
      
      
    }
    
    @IBOutlet weak var favouriteTable: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    func loadData()
    {
        favour = favourite.favourites()
        favouriteTable.reloadData()
        print(favour.count)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favour.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainprofile : FavouriteTableViewCell = tableView.dequeueReusableCell(withIdentifier: "favourites", for: indexPath) as! FavouriteTableViewCell
        let p:profile = favour[indexPath.row]
       
        mainprofile.profilename.text = p.Name
        mainprofile.height_Age.text = "\(p.Age)Yrs, \(p.Height)"
        mainprofile.cast_address.text = "\(p.Cast) ~ \(p.City), \(p.State)"
        if p.Gender == "Male"
        {
            mainprofile.profileimage.image = UIImage(named: "boy")
        }
        else
        {
            mainprofile.profileimage.image = UIImage(named: "girl")
        }
        if p.IsFevourite == 1
        {
            mainprofile.favourite.image = UIImage(named: "heart-f")
        }
        else
        {
            mainprofile.favourite.image = UIImage(named: "heart-e")
        }
        return mainprofile
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let Details : ProfileDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "Details") as! ProfileDetailsViewController
        let p:profile = favour[indexPath.row]
        Details.p = p
        
      
        self.navigationController?.pushViewController(Details, animated: true)
    }
}
    
    
    
  
      


