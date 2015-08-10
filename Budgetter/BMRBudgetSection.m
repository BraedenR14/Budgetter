//
//  BMRBudgetSection.m
//  Budgetter
//
//  Created by braeden on 2015-08-07.
//  Copyright (c) 2015 braeden. All rights reserved.
//

#import "BMRBudgetSection.h"
@interface BMRBudgetSection ()

@property (nonatomic) NSMutableArray *purchases;
@property (nonatomic) double budgetAmount;
@property (nonatomic) NSString *title;

@end

@implementation BMRBudgetSection
#pragma mark - Initialization
- (instancetype)init
{
    return [self initWithTitle:@"Title" budget:0.0];
}

- (instancetype)initWithTitle:(NSString *)title budget:(double)budget
{
    self = [super init];
    
    if (self) {
        self.purchases = [[NSMutableArray alloc] init];
        
        self.budgetAmount = budget;
        self.title = title;
    }
    
    return self;
}
@end
