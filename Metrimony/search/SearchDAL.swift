//
//  SearchDAL.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 24/11/22.
//

import UIKit

class SearchDAL: NSObject {
     func getProfileswithgender(genders:String) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where Gender = '\(genders)'"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    
    func getProfileswithgenderAndage(genders:String,start:Int32,end:Int32) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where Gender = '\(genders)' and Age between '\(start)' and '\(end)'"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    
    func getProfileswithgenderAndcaste(genders:String,caste:String) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where Gender = '\(genders)' and CasteName = '\(caste)'"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    
    func getProfileswithageAndcaste(caste:String,start:Int32,end:Int32) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where CasteName = '\(caste)' and Age between '\(start)' and '\(end)'"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    
    func getProfilewithAge(start:Int32,end:Int32) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where Age between '\(start)' and '\(end)'"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    
    func getProfilewithcaste(caste:String) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where CasteName = '\(caste)'"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    func getProfilewithAll(genders:String,start:Int32,end:Int32,caste:String) -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where CasteName = '\(caste)' and Gender = '\(genders)' and Age between '\(start)' and '\(end)' "
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
    
    func getProfile() -> [profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                
                
                while(resultset1.next())
                {
                    let p:profile = profile()
                    p.profileid = resultset1.int(forColumn: "ProfileID")
                    p.Name = resultset1.string(forColumn: "Name")!
                    p.Age = resultset1.int(forColumn: "Age")
                    p.City = resultset1.string(forColumn: "City")!
                    p.State = resultset1.string(forColumn: "State")!
                    p.Height = resultset1.string(forColumn: "Height")!
                    p.Cast = resultset1.string(forColumn: "CasteName")!
                    p.CasteID = resultset1.int(forColumn: "CasteID")
                    p.Address = resultset1.string(forColumn: "Address")!
                    p.Education = resultset1.string(forColumn: "Education")!
                    p.Email = resultset1.string(forColumn:"Email")!
                    p.IsFevourite = resultset1.int(forColumn: "IsFavourite")
                    p.Phone = resultset1.int(forColumn: "Phone")
                    p.Mobile = resultset1.int(forColumn: "Mobile")
                    p.Remark = resultset1.int(forColumn: "Remarks")
                    p.Gender = resultset1.string(forColumn: "Gender")!
                    p.DateofBirth = resultset1.string(forColumn: "DOB")!
                    pro.append(p)
                }
                
            }
            catch
            {
                print(error)
            }
        }
        else{
            print("Database not accessed")
        }
        
        dbconn.close()
        return pro
    }
}
