//
//  SHIOSViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/13/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHIOSViewController: SHQuestionAnswerViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SHProxy.sharedInstance.trackScreen(screenIOS)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackQuestion = "iOS Question"
        loadTableViewWithServerData(questionBase + idIos)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
