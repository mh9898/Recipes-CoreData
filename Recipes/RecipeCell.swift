//
//  RecipeCell.swift
//  Recipes
//
//  Created by MiciH on 5/17/16.
//  Copyright © 2016 MichaelH. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func confgCell(recipe: Recipe){
        
        self.imageCell.image = recipe.getRecipeImage()
        self.labelCell.text = recipe.title
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
