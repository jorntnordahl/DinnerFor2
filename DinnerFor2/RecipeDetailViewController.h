//
//  DetailViewController.h
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Recipe.h"

@interface DetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UITextView *ingredientsTextView;
@property (nonatomic, retain) IBOutlet UITextView *directionsTextView;

@property (nonatomic, retain) Recipe *recipe;

-(void) setDetailItem:(Recipe *)aRecipe;
@end
