//
//  Recipe.m
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

//the and thing is not really part of the convention.
-(void) initWithName:(NSString *)name ingredients:(NSString *)ingredients directions:(NSString *)directions
{
    self.name = name;
    self.ingredients = ingredients;
    self.directions = directions;
}

-(BOOL) isEqual:(Recipe *) theRecipe
{
    if ([_name isEqualToString:theRecipe.name] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void) dealloc
{
    self.name = nil;
    self.ingredients = nil;
    self.directions = nil;
    
    [super dealloc];
}

-(void) print
{
    NSLog(@"================================================");
    NSLog(@"|           %-31s    |", [_name UTF8String]);
    NSLog(@"|           %s    |", [_ingredients UTF8String]);
    NSLog(@"|           %s    |", [_directions UTF8String]);
    NSLog(@"|                                              |");
    NSLog(@"|                O          O                  |");
    NSLog(@"================================================");
}

@end
