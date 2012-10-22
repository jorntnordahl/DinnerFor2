//
//  RecipeBook.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "RecipeBook.h"

@implementation RecipeBook

-(id) initWithName: (NSString *) name
{
    self = [super init];
    
    if (self)
    {
        self.bookName = [NSString stringWithString:name];
        self.book = [NSMutableArray array];
    }
    
    return self;
}


// method adds the recipe to the list of recipes:
-(void) addRecipe: (Recipe *) theRecipe
{
    [_book addObject:theRecipe];
}

-(void) removeRecipe:(Recipe *)theRecipe
{
    [_book removeObject:theRecipe];
}



-(NSUInteger) entries
{
    return [_book count];
}

-(void) list
{
    if ([_book count] > 0)
    {
        for (Recipe *theRecipe in _book)
        {
            [theRecipe print];
        }
    }
    else
    {
        NSLog(@"Recipe Book is empty...");
    }
}

-(Recipe *) lookup: (NSString *) theName
{
    
    return nil;
}

-(void) sort
{
    // sort using a comparator:
    [_book sortUsingComparator:^NSComparisonResult(Recipe *obj1, Recipe *obj2) {
        NSLog(@"Comparator: %@ vs. %@", [obj1 name], [obj2 name]);
        return [[obj1 name] compare: [obj2 name]];
    }];
}

-(Recipe *) findByIndex:(NSInteger) theRow
{
    if (!_book)
    {
        NSLog(@"The book is null!!! WHY???");
        return nil;
    }
    
    if ([_book count] == 0)
    {
        NSLog(@"The book contains zero objects!!! WHYY????");
        return nil;
    }
    
    Recipe *object = [_book objectAtIndex:theRow];
    if (!object)
    {
        NSLog(@"Unable to find object at index %i", theRow);
        return nil;
    }
    return object;
}

-(void) removeRecipeAtIndex:(NSInteger) theRow
{
    [_book removeObjectAtIndex:theRow];
}

-(void) dealloc
{
    self.bookName = nil;
    self.book = nil;
    
    [super dealloc];
    
}


@end
