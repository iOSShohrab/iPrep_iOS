//
//  SHiPad_MoreViewController.swift
//  iPrep
//
//  Created by Md Shohrab on 11/28/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHiPad_MoreViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var mywebview : UIWebView!
    var overLayView : SHOverlayView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBannerAdMobView()
        SHProxy.sharedInstance.trackScreen(screenMore)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOverLayView()
        let url = URL(string: youtubeVideoURL)
        let request = URLRequest(url: url!)
        mywebview.delegate = self
        mywebview.loadRequest(request)
    }
    
    func addBannerAdMobView(){
    }
    
    func hideOverLayView(){
        UIView.transition(with: self.overLayView, duration: 1, options: UIViewAnimationOptions.transitionCrossDissolve, animations: nil, completion: nil)
        self.overLayView.isHidden = true
        self.overLayView.imageProgress.stopAnimating()
        
    }
    
    func showOverLayView(){
        if self.overLayView == nil {
            self.overLayView = SHProxy.sharedInstance.loadOverLayView(self.view)
            self.view .addSubview(self.overLayView)
        }
        self.overLayView.imageProgress.startAnimating()
        self.overLayView.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        hideOverLayView()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error){
        hideOverLayView()
    }
    
    @IBAction func felsButtonPressed(_ sender: AnyObject) {
        SHProxy.sharedInstance.trackEvent("FELS", questionId: "fels")
        UIApplication.shared.openURL(URL(string: "http://fuzzelogicsolutions.com")!)
    }
}
