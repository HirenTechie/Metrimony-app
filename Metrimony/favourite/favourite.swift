//
//  favourite.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 22/11/22.
//

import UIKit

class favourite: NSObject {
    class func favourites()->[profile]
    {
        var pro:[profile] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Profile inner join Caste on Profile.CasteID=Caste.CasteID where IsFavourite = 1"
            
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
    
    class func changeIsFavourite(p:profile) -> Bool
{
    var status : Bool = Bool()
    let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
    
    if dbconn.open()
    {
        let query = "update Profile set IsFavourite = 1 where ProfileId = \(p.profileid)"
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
        print("not connection with data base")
    }
    dbconn.close()
    return status
}
    
    class func DeleteIsFavourite(p:profile) -> Bool
{
    var status : Bool = Bool()
    let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
    
    if dbconn.open()
    {
        let query = "update Profile set IsFavourite = 0 where ProfileId = \(p.profileid)"
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
        print("not connection with data base")
    }
    dbconn.close()
    return status
}
}
