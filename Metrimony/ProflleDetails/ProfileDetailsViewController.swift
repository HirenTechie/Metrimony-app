//
//  ProfileDetailsViewController.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 19/11/22.
//

import UIKit

class ProfileDetailsViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var profilename: UILabel!
    
    @IBOutlet weak var birthdate: UILabel!
    
    @IBOutlet weak var birthplace: UILabel!
    
    
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var education: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    @IBOutlet weak var mobile: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var Email: UILabel!
    
    
    @IBOutlet weak var AddToFavourite: UIButton!
    
    
    var p: profile = profile()
    

    override func viewDidLoad() {
        if p.Gender == "Male"
        {
            image.image = UIImage(named: "boy")
        }
        else
        {
            image.image = UIImage(named: "girl")
        }
        profilename.text = p.Name
        birthdate.text = p.DateofBirth
        birthplace.text = p.City
        gender.text = p.Gender
        height.text = p.Height
        age.text = "\(p.Age)"
        education.text = p.Education
        phone.text = "\(p.Phone)"
        mobile.text = "\(p.Mobile)"
        address.text = "\(p.City), \(p.State)"
        Email.text = p.Email
        if p.IsFevourite == 1
        {
            AddToFavourite.setTitle("Remove From Favourite", for: .normal)
        }
        else
        {
            AddToFavourite.setTitle("Add To Favourite", for: .normal)
        }

        super.viewDidLoad()

       
    }

    @IBAction func AddToFavourite(_ sender: Any) {
        if AddToFavourite.titleLabel?.text == "Add To Favourite"
        {
            AddToFavourite.setTitle("Remove From Favourite", for: .normal)
            favourite.changeIsFavourite(p: p)
        }
        else
        {
            AddToFavourite.setTitle("Add To Favourite ", for: .normal)
            favourite.DeleteIsFavourite(p: p)
        }
    }
    
}
