//
//  RecipeBook.h
//  DinnerFor2
//
//  Created by Jorn Nordahl on 10/21/12.
//  Copyright (c) 2012 Jorn Nordahl. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Recipe.h"

@interface RecipeBook : NSObject

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

-(id) initWithName: (NSString *) name;
-(void) addRecipe: (Recipe *) theRecipe;
-(void) removeRecipe: (Recipe *) theRecipe;
-(NSUInteger) entries;
-(void) list;
-(Recipe *) lookup: (NSString *) theName;
-(void) sort;
-(Recipe *) findByIndex:(NSInteger) theRow;
-(void) removeRecipeAtIndex:(NSInteger) theRow;

@end
