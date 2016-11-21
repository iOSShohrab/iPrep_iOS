//
//  SHCommonControllerViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 12/2/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHCommonControllerViewController: UIViewController {
    
    var trackQuestion = String()
    var urlToGetDataFromServer = String()
    var dataArray = [SHQuesAns]()
    var overLayView : SHOverlayView!
    
    @IBOutlet weak var questionTableView : UITableView!
    @IBOutlet weak var txtAnswer : UITextView!
    @IBOutlet weak var txtQuestion : UILabel!
    @IBOutlet weak var totalQuestion : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        addFullAdMobView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBannerAdMobView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - AdMob
    
    func addBannerAdMobView(){
        //Yahoo ad will be here
    }
    
    func addFullAdMobView(){
        //Yahoo Full ad view
    }
    
    //MARK: - Custom
    
    func showOverLayView(){
        if self.overLayView == nil {
            self.overLayView = SHProxy.sharedInstance.loadOverLayView(self.view)
            self.view .addSubview(self.overLayView)
        }
        self.overLayView.imageProgress.startAnimating()
        self.overLayView.isHidden = false
    }
    
    func hideOverLayView(){
        UIView.transition(with: self.overLayView, duration: 1, options: UIViewAnimationOptions.transitionCrossDissolve, animations: nil, completion: nil)
        self.overLayView.isHidden = true
        self.overLayView.imageProgress.stopAnimating()
        
    }
    
    func dataReceievedFromServer(){
        self.questionTableView.reloadData()
        totalQuestion.text = "Questions (\(self.dataArray.count))"
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(SHCommonControllerViewController.hideOverLayView), userInfo: nil, repeats: false)
    }
    
    //MARK: - Server Request
    
    @IBAction func updateQuestionButtonPressed(_ sender: UIButton) {
        loadTableViewWithServerData(urlToGetDataFromServer)
    }
    
    func loadTableViewWithServerData(_ _url:String){
        urlToGetDataFromServer = _url
        print(urlToGetDataFromServer)
        showOverLayView()
        let postEndpoint: String = _url
        let session = URLSession.shared
        let url = URL(string: postEndpoint)!
        session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            let post: NSMutableArray
            do {
                post = try JSONSerialization.jsonObject(with: responseData,
                    options: []) as! NSMutableArray
                self.dataArray = SHDataAccess().arrayFromPlist(post)
                DispatchQueue.main.async(execute: { () -> Void in
                    self.dataReceievedFromServer()
                })
            } catch  {
                print("error trying to convert data to JSON")
            }
            
        }).resume()
    }
    
    //MARK: - QuestionTableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let aCell = self.questionTableView.dequeueReusableCell(withIdentifier: "qcell",for: indexPath) as! SHQuestionCell
        let q : SHQuesAns = self.dataArray[(indexPath as NSIndexPath).row]
        aCell.lblQuestion.text = "\((indexPath as NSIndexPath).row + 1). \(q.question)"
        return aCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        let q : SHQuesAns = self.dataArray[(indexPath as NSIndexPath).row]
        let temp : UILabel = UILabel()
        return temp.currentHeight(q.question, _frame : tableView.frame) + 30
    }
    
    func showAnswerOfSelectedQuestion(_ rowNumber : Int){
        let q : SHQuesAns = self.dataArray[rowNumber]
        txtQuestion.text = "\(rowNumber + 1). \(q.question)"
        txtAnswer.text = q.answer
        SHProxy.sharedInstance.trackEvent(trackQuestion, questionId: q.questionId)
        if SHProxy.sharedInstance.questionClickCount == adMobCountFull {
            SHProxy.sharedInstance.questionClickCount = 0
            addFullAdMobView()
        }
        else{
            SHProxy.sharedInstance.questionClickCount += 1
        }
    }

}
