//
//  WeathersTableViewCell.swift
//  Weather
//
//  Created by Gerasim Israyelyan on 1/23/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class WeathersTableViewCell: UITableViewCell {

    @IBOutlet weak var regionName: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
