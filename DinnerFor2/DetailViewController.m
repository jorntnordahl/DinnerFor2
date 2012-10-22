//
//  DetailViewController.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "DetailViewController.h"

#import "Recipe.h"
#import "RecipeBook.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize nameTextField, ingredientsTextView, directionsTextView, recipe;

- (void)dealloc
{
    [recipe release];
    [nameTextField release];
    [ingredientsTextView release];
    [directionsTextView release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)theObject
{
    Recipe *newRecipe = (Recipe *) theObject;
    
    if (newRecipe != recipe) {
        [recipe release];
        recipe = [newRecipe retain];

        // Update the view.
        [self configureView];
    }
}

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
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
