//
//  ViewController.swift
//  SwiftStudy
//
//  Created by shuqiong on 7/25/14.
//  Copyright (c) 2014 shuqiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, addPlayerControllerDelegate {
    
    var players: NSMutableArray!
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Players"
        
//        view
        tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView!.dataSource = self
        tableView!.delegate = self
        self.view.addSubview(tableView)
        
        tableView!.registerClass(PlayerCell().classForCoder, forCellReuseIdentifier: "playerCell")
        
        let addItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addPlayer:")
        self.navigationItem.rightBarButtonItem = addItem
        
//        data source
        if (!self.players) {
            self.players = NSMutableArray.array()
        }
        
        var player = Player()
        player.name = "Bob Simith"
        player.game = "Orbitum"
        player.rating = 5
        self.players.addObject(player)
        
        player = Player()
        player.name = "Jared Shu"
        player.game = "Login HD"
        player.rating = 3
        self.players.addObject(player)
        
        player = Player()
        player.name = "Kimi"
        player.game = "where the father's go"
        player.rating = 5
        self.players.addObject(player)
    }
    
//MARK: - tableview
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("playerCell") as PlayerCell
        
        cell.setContent(self.players[indexPath.row], indexPath: indexPath)
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
//MARK: - custome function
    func addPlayer(sender: UIBarButtonItem!) {
        
        let addPlayerCtr = AddPlayerController()
        addPlayerCtr.title = "Add Player"
        addPlayerCtr.game = "Chess"
        addPlayerCtr.delegate = self
        
        let navigationCtr = UINavigationController(rootViewController: addPlayerCtr)
        
        self.presentViewController(navigationCtr, animated: true, completion: nil)
    }
    
//    MARK: - AddPlayerControllerDelegate
    func addPlayerController(controller: AddPlayerController, player: Player) {
        
        self.players.addObject(player)
        self.tableView!.insertRowsAtIndexPaths([NSIndexPath(forRow: self.players.count-1, inSection: 0)], withRowAnimation: .Automatic)
    }
    
}

