//
//  SHDataAccess.swift
//  iPrep
//
//  Created by Md Shohrab on 11/13/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

var fileName : String!
class SHDataAccess: NSObject {
    
    func arrayFromPlist(_ serverArr : NSMutableArray) -> Array <SHQuesAns>{
        var dataObj = [SHQuesAns]()
        for data in serverArr {
            dataObj.append(SHQuesAns.init(_dic: data as! NSDictionary))
        }
        return dataObj
    }

}
