//
//  SHQuesAns.swift
//  iPrep
//
//  Created by Md Shohrab on 11/16/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHQuesAns: NSObject {
    var question : String
    var answer : String
    var questionId : String
    
    init(_dic : NSDictionary!){
        self.question = String(describing: _dic["qtext"]!)
        self.answer = String(describing: _dic["anstext"]!)
        self.questionId = String(describing: _dic["id"]!)
    }
}
