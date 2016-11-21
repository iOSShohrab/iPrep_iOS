//
//  SHProxy.swift
//  iPrep
//
//  Created by Md Shohrab on 11/30/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHProxy: NSObject {
    
    static let sharedInstance = SHProxy()
    var questionClickCount = 0
    fileprivate override init() {
        super.init()
    }
    
    func loadOverLayView(_ _view : UIView) -> SHOverlayView
    {
        let overLayView = SHOverlayView.instanceFromNib()
        overLayView.frame = _view.frame
        
        
        var images: [UIImage] = []
        for i in 1...2 {
            images.append(UIImage(named: "p\(i).png")!)
        }
        overLayView.imageProgress.animationImages = images
        overLayView.imageProgress.animationDuration = 1.5
        return overLayView
    }
    
    func trackScreen(_ screenName : String){
        let tracker = GAI.sharedInstance().defaultTracker
        tracker?.set(kGAIScreenName, value: screenName)
        let builder = GAIDictionaryBuilder.createScreenView()
        tracker?.send(builder?.build() as [AnyHashable: Any])
    }
    
    func trackEvent(_ eventName : String, questionId : String){
        let tracker = GAI.sharedInstance().defaultTracker
        let builder = GAIDictionaryBuilder.createEvent(withCategory: eventName, action: questionId, label: "Row", value: 1)
        tracker?.send(builder?.build() as [AnyHashable: Any])
    }

}
