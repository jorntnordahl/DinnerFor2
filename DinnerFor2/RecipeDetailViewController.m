//
//  DetailViewController.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "RecipeDetailViewController.h"

#import "Recipe.h"

@interface RecipeDetailViewController ()
- (void)configureView;
@end

@implementation RecipeDetailViewController

#pragma mark - Managing the detail item

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.recipe) {
        self.nameTextField.text = [self.recipe name];
        self.ingredientsTextView.text = [self.recipe ingredients];
        self.directionsTextView.text = [self.recipe directions];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
