//
//  MasterViewController.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "RecipeBookViewController.h"

#import "RecipeDetailViewController.h"
#import "Recipe.h"
#import "RecipeBook.h"

@interface RecipeBookViewController () {
    RecipeBook *recipeBook;
}
@end

@implementation RecipeBookViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)dealloc
{
    [recipeBook release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!recipeBook) {
        recipeBook = [[[RecipeBook alloc] initWithName:@"Jorns RecipeBook"] retain];
    }
    
    // create a new recipe and insert into first position:
    //dont retain here you dont own the object always autorelease
    Recipe *recipe = [[[Recipe alloc] init] autorelease];
    recipe.name = @"New Recipe";
    [recipeBook addRecipe:recipe];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    
    /*RecipeDetailViewController *detailController = [[RecipeDetailViewController alloc] initWithNibName:@"MainStoryBoard.storyboard" bundle:nil];
    [self presentViewController:detailController animated:YES completion:nil];
    
    
    
    [detailController release];
    */
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Table has %i rows", recipeBook.entries);
    return recipeBook.entries;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Recipe *recipe = [recipeBook findByIndex:indexPath.row];
    cell.textLabel.text = recipe.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [recipeBook removeRecipeAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

//no try catch blocks dude for this kind of code if that was genned by apple Im shocked.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       
            Recipe *recipe = [recipeBook findByIndex:indexPath.row];
        
            assert(recipe);
        
            //the ViewControllers viewDidLoad has not been called yet we dont need to call a special
            //setter we can just set the recipe property and let the view init internally in viewDidLoad

            ((RecipeDetailViewController*)[segue destinationViewController]).recipe = recipe;
    }
           
}

@end
