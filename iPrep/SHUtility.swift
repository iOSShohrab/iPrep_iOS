//
//  SHUtility.swift
//  iPrep
//
//  Created by Md Shohrab on 11/15/15.
//  Copyright © 2015 VZW. All rights reserved.
//

import UIKit

enum UIUserInterfaceIdiom : Int
{
    case unspecified
    case phone
    case pad
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

class SHUtility: NSObject {
    class func uiScreenPercentage (_ baseUiSize : Float) -> Float{
        return Float(UIScreen.main.bounds.size.width)/baseUiSize
    }
    
    class func tableYForiPhone() -> CGFloat{
        let _d =  400.0 * Float(UIScreen.main.bounds.size.width)/320.0
        if DeviceType.IS_IPHONE_6{
            return CGFloat(_d + 30)
        }
        else if DeviceType.IS_IPHONE_6P{
            return CGFloat(_d + 51)
        }
        return CGFloat(_d)
        
    }
}
