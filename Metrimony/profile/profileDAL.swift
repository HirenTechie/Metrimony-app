//
//  profileDAL.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 18/11/22.
//

import UIKit

class profileDAL: NSObject {
    
    class func getProfile()->[profile]
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
    
    class func addProfile(p:profile) -> Bool
    {
        var status:Bool = Bool()
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        if dbconn.open()
        {
            let query = "insert into Profile(Name,Gender,DOB,Age,Education,Height,Address,City,State,Phone,Mobile,Email,CasteID) values ('\(p.Name)','\(p.Gender)','\(p.DateofBirth)','\(p.Age)','\(p.Education)','\(p.Height)','\(p.Address)','\(p.City)','\(p.State)','\(p.Phone)','\(p.Mobile)','\(p.Email)','\(p.CasteID)')"

            do
            {
                let resultset = try dbconn.executeUpdate(query, withArgumentsIn: [])
                if resultset
                {
                    status = true
                }
                else
                {
                    status = false
                }

            }
            catch
            {
                print(error)
            }
        }
        else
        {
            print("Database not accessed")
        }
        dbconn.close()
        
        return status
    }
    
    class func deleteProfile(p:profile) -> Bool
    {
        var status : Bool = Bool()
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        if dbconn.open()
        {
            let query1 = "delete from Profile Where ProfileID = '\(p.profileid)'"

            do
            {
                let resultset1 = try dbconn.executeUpdate(query1, withArgumentsIn: [])
                
                if resultset1
                {
                    status = true
                }
                else
                {
                    status = false
                }
 

            }
            catch
            {
                print(error)
            }
        }
        else
        {
            print("Database not accessed")
        }

        return true
    }
    
    class func editProfile(p:profile) -> Bool
    {
        var status:Bool = Bool()
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        if dbconn.open()
        {
            let query = "update Profile set Name = '\(p.Name)',Gender = '\(p.Gender)',DOB = '\(p.DateofBirth)',Age = '\(p.Age)',Education = '\(p.Education)',Height = '\(p.Height)', State = '\(p.State)',Phone = '\(p.Phone)',Mobile = '\(p.Mobile)',Email = '\(p.Email)',CasteID = '\(p.CasteID)' where ProfileID = '\(p.profileid)'"

            do
            {
                let resultset = try dbconn.executeUpdate(query, withArgumentsIn: [])
                if resultset
                {
                    status = true
                }
                else
                {
                    status = false
                }

            }
            catch
            {
                print(error)
            }
        }
        else
        {
            print("Database not accessed")
        }
        dbconn.close()
        
        return status
    }
    

}
