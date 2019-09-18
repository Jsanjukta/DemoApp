//
//  Constant.swift
//  DemoOne
//
//  Created by Krishna on 18/09/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import Foundation
import  UIKit

struct INITIATE {
    static func INITIATE_STORY_BOARD(identifier: String) -> Any {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}
