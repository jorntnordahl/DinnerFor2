//
//  Recipe.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

@synthesize name, ingredients, directions;

-(void) setName: (NSString *) theName
{
    self.name = theName;
}

-(void) setName:(NSString *)theName andIngredients:(NSString *)theIngredients andDirections:(NSString *)theDirections
{
    self.name = theName;
    self.ingredients = theIngredients;
    self.directions = theDirections;
}

-(BOOL) isEqual:(Recipe *) theRecipe
{
    if ([name isEqualToString:theRecipe.name] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void) print
{
    NSLog(@"================================================");
    NSLog(@"|           %-31s    |", [name UTF8String]);
    NSLog(@"|           %s    |", [ingredients UTF8String]);
    NSLog(@"|           %s    |", [directions UTF8String]);
    NSLog(@"|                                              |");
    NSLog(@"|                O          O                  |");
    NSLog(@"================================================");
}

@end
