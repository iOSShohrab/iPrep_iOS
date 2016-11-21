//
//  SHiPad_JavaViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/28/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHiPad_JavaViewController: SHiPadQuestionAnswerViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SHProxy.sharedInstance.trackScreen(screenJava)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        trackQuestion = "Java Question"
        loadTableViewWithServerData(questionBase + idJava)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
