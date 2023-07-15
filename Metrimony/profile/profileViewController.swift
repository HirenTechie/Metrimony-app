//
//  profileViewController.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 18/11/22.
//

import UIKit

    

class profileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
  
    
    var pro:[profile] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
      
    }
    
    @IBOutlet weak var updateTable: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    func loadData()
    {
        pro = profileDAL.getProfile()
//
        
        updateTable.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainprofile : ProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainprofile", for: indexPath) as! ProfileTableViewCell
        let p:profile = pro[indexPath.row]
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
        let p:profile = pro[indexPath.row]
        Details.p = p
        
      
        self.navigationController?.pushViewController(Details, animated: true)
    }
    
    @IBAction func Addprofile(_ sender: UIBarButtonItem) {
        let Add : AddProfileViewController = storyboard?.instantiateViewController(withIdentifier: "Add") as! AddProfileViewController
       
        self.navigationController?.pushViewController(Add, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let p:profile = self.pro[indexPath.row]
        let delete = UITableViewRowAction(style: .default, title: "Delete") { UITableViewRowAction, IndexPath in
           
            
            let alert = UIAlertController(title: "Delete", message: "delete \(p.Name)'s profile", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: { UIAlertAction in
                let status = profileDAL.deleteProfile(p: p)
                if status
                {
                    self.loadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default))
            self.present(alert, animated: true)
            
            
        }
        let Edit = UITableViewRowAction(style: .default, title: "Edit") {  UITableViewRowAction, IndexPath in
            let Add : AddProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "Add") as! AddProfileViewController
            Add.pro = p
            Add.fromscreen = "edit"
            self.navigationController?.pushViewController(Add, animated: true)
        }
        Edit.backgroundColor = .lightGray
        return [delete,Edit]
    }
    
}

