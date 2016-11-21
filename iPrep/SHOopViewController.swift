//
//  SHOopViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/13/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHOopViewController: SHQuestionAnswerViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SHProxy.sharedInstance.trackScreen(screenOOP)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        trackQuestion = "OOP Question"
        loadTableViewWithServerData(questionBase + idOop)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
