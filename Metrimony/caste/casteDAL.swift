//
//  casteDAL.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 23/11/22.
//

import UIKit

class casteDAL: NSObject {
    class func getCaste()->[Caste]
    {
        var castes:[Caste] = []
        
        let dbconn = FMDatabase(path: Utility.getPath(Utility.dbName))
        
        if dbconn.open()
        {
            let query1 = "select * from Caste"
            
            do
            {
                let resultset1 = try dbconn.executeQuery(query1, values: [])
                               
                
                while(resultset1.next())
                                {
                    let c: Caste = Caste()
                    c.CasteID = resultset1.int(forColumn: "CasteID")
                    c.CasteName = resultset1.string(forColumn: "CasteName")!
                    castes.append(c)
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
        return castes
    }
}
