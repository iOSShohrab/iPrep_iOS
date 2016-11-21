//
//  SHiPad_AndroidViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/28/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHiPad_AndroidViewController: SHiPadQuestionAnswerViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SHProxy.sharedInstance.trackScreen(screenAndroid)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        trackQuestion = "Android Question"
        loadTableViewWithServerData(questionBase + idAndroid)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
