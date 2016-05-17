//
//  Recipe.swift
//  Recipes
//
//  Created by MiciH on 5/17/16.
//  Copyright © 2016 MichaelH. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Recipe: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    //Covert coreData images to data
    
    func setRecipeImage(img : UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data
        
    }
    
    func getRecipeImage() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }

}
