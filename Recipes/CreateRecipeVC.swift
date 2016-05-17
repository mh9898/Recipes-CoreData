//
//  CreateRecipeVC.swift
//  Recipes
//
//  Created by MiciH on 5/17/16.
//  Copyright © 2016 MichaelH. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeVC: UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {

    
    @IBOutlet weak var recipeTitle: UITextField!
    @IBOutlet weak var recipeIngrediens: UITextField!
    @IBOutlet weak var recipeSteps: UITextField!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        dismissViewControllerAnimated(true, completion: nil)
        recipeImage.image = image
    }

    @IBAction func addImgeAction(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func createAction(sender: AnyObject) {
        if let title = recipeTitle.text where recipeTitle.text != "" {
          
            //to save we need the context in the app delegate
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = title
            recipe.ingredients = recipeIngrediens.text
            recipe.steps = recipeSteps.text
            recipe.setRecipeImage(recipeImage.image!)
            
        context.insertObject(recipe)
            
            do{
                try context.save()
            } catch{
                print("did not save")
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
}
