//
//  DetailViewController.h
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Recipe.h"

@interface RecipeDetailViewController : UIViewController

//the view retains these no need to retain them
@property (nonatomic, assign) IBOutlet UITextField *nameTextField;
@property (nonatomic, assign) IBOutlet UITextView *ingredientsTextView;
@property (nonatomic, assign) IBOutlet UITextView *directionsTextView;

//just use assign since we know this is managed in a master list somewhere else
@property (nonatomic, assign) Recipe *recipe;

// actions done inside the detail view:
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)saveButtonTapped:(id)sender;


@end
