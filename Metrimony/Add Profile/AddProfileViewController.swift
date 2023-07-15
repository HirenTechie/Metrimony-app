//
//  AddProfileViewController.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 20/11/22.
//

import UIKit

class AddProfileViewController: UIViewController, UIPickerViewDataSource , UIPickerViewDelegate{
   
    

    @IBOutlet weak var Name: UITextField!
    
    
    @IBOutlet weak var DOB: UIDatePicker!
    
    @IBOutlet weak var place: UITextField!
    
    
    @IBOutlet weak var gendersegment: UISegmentedControl!
    
    
    @IBOutlet weak var height: UITextField!
    
    
    @IBOutlet weak var age: UITextField!
    
    
    @IBOutlet weak var education: UITextField!
    
    
    @IBOutlet weak var phone: UITextField!
    
    
    @IBOutlet weak var mobile: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
   
    @IBOutlet weak var castes: UITextField!
    
    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    
    @IBOutlet weak var btnAction: UIButton!
    var castepicker : UIPickerView = UIPickerView()
    var gender : String = String()
    var pro : profile = profile()
    var casteselected : Caste = Caste()
    var caste: [Caste] = []
    var fromscreen = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        castepicker.dataSource = self
        castepicker.delegate = self
        caste = casteDAL.getCaste()
        castes.inputView = castepicker
        
        if fromscreen == "edit"
        {
            self.title = "\(pro.Name)"
            Name.text = pro.Name
            place.text = pro.City
            height.text = pro.Height
            age.text = "\(pro.Age)"
            city.text = pro.City
            state.text = pro.State
            education.text = pro.Education
            email.text = pro.Email
            mobile.text = "+91 \(pro.Mobile)"
            phone.text = "\(pro.Phone)"
            
            btnAction.setTitle("Update", for: .normal)
            
            
            
        }
        else{
            self.title = "Add New Profile"
            btnAction.setTitle("Add", for: .normal)
        }
     
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return caste.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let c: Caste = caste[row]
        return c.CasteName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c: Caste = caste[row]
        castes.text = c.CasteName
        casteselected.CasteID = c.CasteID
        casteselected.CasteName = c.CasteName
        castes.resignFirstResponder()
    }
    
    
    
    
    @IBAction func genderAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            gender = "Male"
        }
        else
        {
            gender  = "Female"
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        Name.text = ""
        place.text  = ""
        
        height.text = ""
        age.text = ""
        education.text = ""
        phone.text = ""
        mobile.text = ""
        email.text = ""
        city.text = ""
        state.text  = ""
        Name .resignFirstResponder()
        DOB.resignFirstResponder()
        city.resignFirstResponder()
        height.resignFirstResponder()
        age.resignFirstResponder()
        education.resignFirstResponder()
        phone.resignFirstResponder()
        mobile.resignFirstResponder()
        state.resignFirstResponder()
        email.resignFirstResponder()
        
    }
    

    @IBAction func add(_ sender: UIButton) {
        let p : profile = profile()
        if fromscreen == "edit"
        {
            p.profileid = pro.profileid
        }
        p.Name = Name.text!
        p.City = city.text!
        p.Gender = gender
        p.Height = height.text!
        let ag = age.text!
        p.Age = Int32(ag) ?? 0
        p.Education = education.text!
        let ph = phone.text!
        p.Phone = Int32(ph) ?? 0
        let mo = mobile.text!
        p.Mobile = Int32(mo) ?? 0
        p.State = state.text!
        p.Email = email.text!
        p.Address = city.text!
        p.CasteID = casteselected.CasteID
            Name .resignFirstResponder()
            DOB.resignFirstResponder()
            city.resignFirstResponder()
            height.resignFirstResponder()
            age.resignFirstResponder()
            education.resignFirstResponder()
            phone.resignFirstResponder()
            mobile.resignFirstResponder()
            state.resignFirstResponder()
            email.resignFirstResponder()
            castes.resignFirstResponder()
       
        print(p.CasteID)
        let selecteddate = DOB.date
        let f = DateFormatter()
        f.dateFormat = "dd-MM-yyyy"
        p.DateofBirth = f.string(from: selecteddate)
        
        var status  = false
        
        if fromscreen == "edit"
        {
        
            status = profileDAL.editProfile(p: p)
        }
        else
        {
            status = profileDAL.addProfile(p: p)
        }
        
        if status
        {
            let alert = UIAlertController(title: "Profile", message: fromscreen == "edit" ? "record updated" : "record inserted successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default,handler: { UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert,animated: true)
        }

        
    }
    

}
