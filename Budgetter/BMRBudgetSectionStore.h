//
//  BMRBudgetSectionStore.h
//  Budgetter
//
//  Created by braeden on 2015-08-07.
//  Copyright (c) 2015 braeden. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BMRBudgetSection;

@interface BMRBudgetSectionStore : NSObject

@property(nonatomic, readonly) NSArray *allSections;

+ (instancetype)sharedStore;
- (BMRBudgetSection *)createSection;
- (void)removeSection:(BMRBudgetSection *)section;

- (void)moveSectionAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end
