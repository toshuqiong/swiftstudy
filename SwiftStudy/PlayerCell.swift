//
//  PlayerCell.swift
//  SwiftStudy
//
//  Created by shuqiong on 7/25/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var gameLabel: UILabel!
    var ratingLabel: UILabel!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.accessoryType = .DisclosureIndicator
        
        nameLabel = UILabel(frame: CGRectMake(10, 15, 200, 20))
        nameLabel.textColor = UIColor.darkTextColor()
        nameLabel.font = UIFont.systemFontOfSize(17)
        self.contentView.addSubview(nameLabel)
        
        gameLabel = UILabel(frame: CGRectMake(10, 35, 200, 20))
        gameLabel.textColor = UIColor.blueColor()
        gameLabel.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(gameLabel)
        
        ratingLabel = UILabel(frame: CGRectMake(210, 35, 100, 20))
        ratingLabel.textColor = UIColor.blueColor()
        ratingLabel.font = UIFont.systemFontOfSize(14)
        ratingLabel.textAlignment = .Right
        self.contentView.addSubview(ratingLabel)
    }
    
    func setContent(content: AnyObject, indexPath: NSIndexPath) {
        
        let player = content as Player
        
        self.nameLabel.text = player.name
        self.gameLabel.text = player.game
        self.ratingLabel.text = "\(player.rating)"
    }
}
