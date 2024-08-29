//
//  TaskTypeCellTableViewCell.swift
//  SimpleTo-DoManager
//
//  Created by Mikhail Tabakaev on 8/29/24.
//

import UIKit

class TaskTypeCellTableViewCell: UITableViewCell {
    
    @IBOutlet var typeTitle: UILabel!
    @IBOutlet var typeDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
