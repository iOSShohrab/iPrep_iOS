//
//  SHOverlayView.swift
//  iPrep
//
//  Created by Md Shohrab on 12/1/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

class SHOverlayView: UIView {

    @IBOutlet weak var imageProgress: UIImageView!
    
    class func instanceFromNib() -> SHOverlayView {
        return UINib(nibName: "SHOverlayView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SHOverlayView
    }

}
