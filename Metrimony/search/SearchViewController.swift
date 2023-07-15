//
//  SearchViewController.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 22/11/22.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    
    @IBOutlet weak var start_age: UITextField!
    
    @IBOutlet weak var end_age: UITextField!
    
    
    @IBOutlet weak var cast_textfield: UITextField!
    
    var cast_picker : UIPickerView = UIPickerView()
    
   
    
    var searchgender : String = String()
    
    
    var castepicker : UIPickerView = UIPickerView()
    var ps:profile = profile()
    var casteselected : Caste = Caste()
    var caste: [Caste] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        castepicker.dataSource = self
        castepicker.delegate = self
        caste = casteDAL.getCaste()
        cast_textfield .inputView = castepicker
        
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
        cast_textfield.text = c.CasteName
        casteselected.CasteID = c.CasteID
        casteselected.CasteName = c.CasteName
        cast_textfield.resignFirstResponder()
    }
    
    @IBAction func genderAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            searchgender = "Male"
        }
        else
        {
            searchgender  = "Female"
        }
    }
    
    
    
    @IBAction func submit(_ sender: Any) {
        
        var gender  = searchgender
        var s_age = Int32(start_age.text!) ?? 0
        var e_age = Int32(end_age.text!) ?? 0
        var caste = cast_textfield.text!
        var p : [profile] = []
        var searchprofile: SearchDAL = SearchDAL()
        
        if (gender != "")
        {
            p = searchprofile.getProfileswithgender(genders: gender)
            if(gender != "" && caste != "")
            {
                p = searchprofile.getProfileswithgenderAndcaste(genders: gender, caste: caste)
            }
            if (gender != "" && caste != "" && s_age != 0 && e_age != 0)
            {
                p = searchprofile.getProfilewithAll(genders: gender, start: s_age, end: e_age, caste: caste)
            }
        }
        if( caste != "")
        {
            p = searchprofile.getProfilewithcaste(caste: caste)
            if(caste != "" && s_age != 0 && e_age != 0)
            {
                p = searchprofile.getProfileswithageAndcaste(caste: caste, start: s_age, end: e_age)
            }
        }
        if (s_age != 0 && e_age != 0)
        {
            p = searchprofile.getProfilewithAge(start: s_age, end: e_age)
            if(s_age != 0 && e_age != 0 && gender != "")
            {
                p = searchprofile.getProfileswithgenderAndage(genders: gender, start: s_age, end: e_age)
            }
        }
        if (s_age == 0 && e_age == 0 && caste == "" && gender == "")
        {
            p = searchprofile.getProfile()
        }
      
        
        let search_reasult : searchresultViewController = storyboard?.instantiateViewController(withIdentifier: "searchresult") as! searchresultViewController
        search_reasult.pro = p
       
        self.navigationController?.pushViewController(search_reasult, animated: true)
    }
    
    @IBAction func clear(_ sender: Any) {
       
    }
}
