//
//  SHiPad_OopViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/28/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHiPad_OopViewController: SHiPadQuestionAnswerViewController {
    
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
