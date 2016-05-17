//
//  ViewController.swift
//  Recipes
//
//  Created by MiciH on 5/17/16.
//  Copyright © 2016 MichaelH. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        fatchAndSetResults()
        tableView.reloadData()
    }
    
    //coreData///////////
    
    func fatchAndSetResults(){
        //get the conxet for app delegate
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        // to get data you need to fetch a request
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        do{
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    
    //TableView///////
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell{
            let recipe = recipes[indexPath.row]
            
            cell.confgCell(recipe)
            return cell
        }
        else{
            return RecipeCell()
        }
    }
    


}

