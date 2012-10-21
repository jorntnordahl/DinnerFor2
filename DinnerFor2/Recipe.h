//
//  Recipe.h
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *ingredients;
@property (copy, nonatomic) NSString *directions;

-(void) setName: (NSString *) theName;

-(void) setName: (NSString *) theName andIngredients: (NSString *) theIngredients andDirections: (NSString *) theDirections;

-(void) print;

@end
