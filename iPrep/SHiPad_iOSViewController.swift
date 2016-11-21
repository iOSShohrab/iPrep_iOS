//
//  SHiPad_iOSViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/27/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHiPad_iOSViewController: SHiPadQuestionAnswerViewController {
    
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
