//
//  SHiPadQuestionAnswerViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/27/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHiPadQuestionAnswerViewController: SHCommonControllerViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTableView.dataSource = self
        self.questionTableView.delegate=self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - QuestionTableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAnswerOfSelectedQuestion((indexPath as NSIndexPath).row)
    }


}
