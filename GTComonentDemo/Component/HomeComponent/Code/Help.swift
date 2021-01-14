//
//  Help.swift
//  HomeComponent
//
//  Created by 华惠友 on 2021/1/14.
//

import Foundation

extension Bundle{

    class func home() -> Bundle?{
        if let path = Bundle.main.resourcePath, let bundle = Bundle.init(path: path + "/HomeComponentLibrary.bundle"){
            return bundle
        }
        return nil
    }
}

extension UIImage{
    
    class func currentBundle(_ name: String) -> UIImage?{
        return UIImage.init(named: name, in: Bundle.home(), compatibleWith: nil)
    }

}
