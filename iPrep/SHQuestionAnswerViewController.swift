//
//  SHQuestionAnswerViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/13/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

enum tblPositionType {
    case top
    case bottom
    case mid
}

let tblTopY = CGFloat(0.0)
let tblBottomY = CGFloat(SHUtility.tableYForiPhone())
let tblMidY = CGFloat(243.0 * SHUtility.uiScreenPercentage(320))


class SHQuestionAnswerViewController: SHCommonControllerViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tblPosition :tblPositionType = .top
    var currentQuestionIndex = 0
    
    @IBOutlet weak fileprivate var tblContainer : UIView!
    @IBOutlet weak fileprivate var vwTop    : UIView!
    @IBOutlet weak fileprivate var vwMid    : UIView!
    @IBOutlet weak fileprivate var vwBottom : UIView!
    @IBOutlet weak fileprivate var containerY : NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionTableView.dataSource = self
        self.questionTableView.delegate=self
        setInitialPosition()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Set TableView Position
    
    func setInitialPosition(){
        vwBottom.isHidden = true
        vwMid.isHidden = true
        vwTop.isHidden = false
        self.containerY.constant = tblTopY
    }
    
    func updateTableViewPosition(){
        switch tblPosition{
        case .top:
            vwBottom.isHidden = true
            vwMid.isHidden = true
            vwTop.isHidden = false
            self.containerY.constant = tblTopY
            break
            
        case .bottom:
            vwBottom.isHidden = false
            vwMid.isHidden = true
            vwTop.isHidden = true
            self.containerY.constant = tblBottomY
            break
            
        case .mid:
            vwBottom.isHidden = true
            vwMid.isHidden = false
            vwTop.isHidden = true
            self.containerY.constant = tblMidY
            break
        }
        UIView.animate(withDuration: 0.5, animations: {self.view.layoutIfNeeded()})
    }
    
    //MARK: - Button Action
    
    @IBAction func upButtonPressed(){
        setTblPositionValue(.mid)
    }
    
    @IBAction func fullButtonPressed(){
        setTblPositionValue(.top)
    }
    
    @IBAction func downButtonPressed(){
        if tblPosition == .top{
            setTblPositionValue(.mid)
        }
        else if tblPosition == .mid{
            setTblPositionValue(.bottom)
        }
        
    }
    
    func setTblPositionValue(_ _postion : tblPositionType){
        tblPosition = _postion
        updateTableViewPosition()
        
    }
    
    
    //MARK: - QuestionTableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tblPosition == .top{
            setTblPositionValue(.mid)
        }
        currentQuestionIndex = (indexPath as NSIndexPath).row
        showAnswerOfSelectedQuestion((indexPath as NSIndexPath).row)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if currentQuestionIndex + 1 < self.dataArray.count{
            currentQuestionIndex = currentQuestionIndex + 1
            showAnswerOfSelectedQuestion(currentQuestionIndex)
        }
    }
    @IBAction func prevButtonPressed(_ sender: UIButton) {
        if currentQuestionIndex - 1 >= 0{
            currentQuestionIndex = currentQuestionIndex - 1
            showAnswerOfSelectedQuestion(currentQuestionIndex)
        }
    }
}
