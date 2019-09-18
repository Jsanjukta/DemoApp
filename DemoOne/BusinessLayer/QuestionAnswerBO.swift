//
//  QuestionAnswerBO.swift
//  DemoOne
//
//  Created by Krishna on 18/09/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class QuestionAnswerBO: NSObject {
    var strQuestion : String!
    var arrOptionBo = [OptionBO]()
    var strSelectedOption : String?
}
class OptionBO : NSObject {
    var strOption : String!
    var isOptionSelected : Bool = false
}
