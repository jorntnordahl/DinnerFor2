//
//  RecipeBook.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "RecipeBook.h"

@implementation RecipeBook

@synthesize book, bookName;

-(id) initWithName: (NSString *) name
{
    self = [super init];
    
    if (self)
    {
        bookName = [NSString stringWithString:name];
        book = [NSMutableArray array];
    }
    
    return self;
}

-(id) init
{
    return [self initWithName:@"NoName"];
}

-(void) addCard: (Recipe *) theRecipe
{
    [book addObject:theRecipe];
}

-(void) removeRecipe:(Recipe *)theRecipe
{
    [book removeObject:theRecipe];
}



-(NSUInteger) entries
{
    return [book count];
}

-(void) list
{
    if ([book count] > 0)
    {
        for (Recipe *theRecipe in book)
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
    // sort using a selector:
    //[book sortUsingSelector:@selector(compareNames:)];
    
    // sort using a comparator:
    [book sortUsingComparator:^NSComparisonResult(Recipe *obj1, Recipe *obj2) {
        NSLog(@"Comparator: %@ vs. %@", [obj1 name], [obj2 name]);
        return [[obj1 name] compare: [obj2 name]];
    }];
}

-(Recipe *) findByIndex:(NSInteger) theRow
{
    return [book objectAtIndex:theRow];
}

-(void) removeRecipeAtIndex:(NSInteger) theRow
{
    [book removeObjectAtIndex:theRow];
}


@end
