//
//  Recipe.h
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *ingredients;
@property (retain, nonatomic) NSString *directions;

-(void) initWithName: (NSString *) name ingredients: (NSString *) ingredients directions: (NSString *) directions;

-(void) print;

@end
