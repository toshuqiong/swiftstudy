//
//  AddPlayerController.swift
//  SwiftStudy
//
//  Created by shuqiong on 7/25/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

protocol addPlayerControllerDelegate: NSObjectProtocol {
    
    func addPlayerController(controller: AddPlayerController, player: Player)
}

class AddPlayerController: UIViewController, UITableViewDataSource, UITableViewDelegate, GameControllerDelegate {
    
    var tableView: UITableView?
    var game: NSString?
    var delegate: addPlayerControllerDelegate?
    
    override func viewDidLoad() {
        
        tableView = UITableView(frame: self.view.bounds, style: .Grouped)
        tableView!.dataSource = self
        tableView!.delegate = self
        self.view.addSubview(tableView)
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "confirmAdd:")
        self.navigationItem.rightBarButtonItem = addItem
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "cancel:")
        self.navigationItem.leftBarButtonItem = cancelItem
    }
    
//    MARK: - tableview
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        if (0 == section) {
            return "add player"
        }
        return nil
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        if (0 == section) {
            return 2
        }
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {

        var cell: UITableViewCell!
        
        if (0 == indexPath.row) {
            
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell0")
            let nameTextField = UITextField(frame: CGRectMake(10, 0, 300, 44))
            nameTextField.tag = 1000
            cell.contentView.addSubview(nameTextField)
        } else {
            
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell1")
            cell.accessoryType = .DisclosureIndicator
            cell.textLabel.text = self.game
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if (0 == indexPath.row) {
            return ;
        }
        
        let gameCtr = GameController()
        gameCtr.title = "Chose Game"
        gameCtr.game = self.game
        gameCtr.delegate = self
        self.navigationController.pushViewController(gameCtr, animated: true)
    }
    
//    MARK: - customer fuction
    func confirmAdd(sender: UIBarButtonItem!) {
        
        let player = Player()
        
        var cell = self.tableView?.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))
        let nameTextField = cell!.contentView.viewWithTag(1000) as UITextField
        if (nil != nameTextField) {
            player.name = nameTextField.text
        }
        player.game = self.game
        player.rating = Int8(arc4random_uniform(5) + 1)
        
        self.delegate!.addPlayerController(self, player: player)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func cancel(sender: UIBarButtonItem!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    MARK: - gameControllerDelegate
    func gameController(controller: GameController, selectedGame: String) {
        self.game = selectedGame
        self.tableView?.reloadRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: 0)], withRowAnimation: .Automatic)
    }
}