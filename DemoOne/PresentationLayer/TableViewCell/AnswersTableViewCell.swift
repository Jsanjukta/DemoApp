//
//  AnswersTableViewCell.swift
//  DemoOne
//
//  Created by Krishna on 18/09/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class AnswersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAnswer: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
