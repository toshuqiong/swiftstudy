//
//  GameController.swift
//  SwiftStudy
//
//  Created by shuqiong on 7/25/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

protocol GameControllerDelegate: NSObjectProtocol {
    
    func gameController(controller: GameController, selectedGame: String)
}

class GameController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dataArray: NSMutableArray?
    var delegate: GameControllerDelegate?
    var game: NSString?
    
    override func viewDidLoad() {
        
        if (nil == dataArray) {
            dataArray = NSMutableArray.array()
        }
        dataArray?.addObject("Chess")
        dataArray?.addObject("Temple Run")
        dataArray?.addObject("Flapy Bird")
        dataArray?.addObject("Angry Bird")
        
        let tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "gameCell")
    }
    
//    MARK: - tableview
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("gameCell") as UITableViewCell
        cell.textLabel.text = dataArray![indexPath.row] as String
        
//        println("%@%@",cell.textLabel.text, self.game)    //cause something woring
        
        if (self.game!.isEqualToString(cell.textLabel.text)) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.delegate?.gameController(self, selectedGame: "\(dataArray![indexPath.row])")
        self.navigationController.popViewControllerAnimated(true)
    }
}
