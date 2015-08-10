//
//  BMRBudgetSectionStore.m
//  Budgetter
//
//  Created by braeden on 2015-08-07.
//  Copyright (c) 2015 braeden. All rights reserved.
//

#import "BMRBudgetSectionStore.h"
#import "BMRBudgetSection.h"

@interface BMRBudgetSectionStore ()

@property (nonatomic) NSMutableArray *privateSections;

@end

@implementation BMRBudgetSectionStore
#pragma mark - Class Methods
+ (instancetype)sharedStore
{
    static BMRBudgetSectionStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BMRBudgetSection sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateSections = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allSections
{
    return [self.privateSections copy];
}

- (BMRBudgetSection *)createSection
{
    BMRBudgetSection *section = [[BMRBudgetSection alloc] init];
    
    [self.privateSections addObject:section];
    
    return section;
}

- (void)removeSection:(BMRBudgetSection *)section
{
    [self.privateSections removeObjectIdenticalTo:section];
}

- (void)moveSectionAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    BMRBudgetSection *movedSection = self.privateSections[fromIndex];
    
    [self.privateSections removeObjectAtIndex:fromIndex];
    
    [self.privateSections insertObject:movedSection atIndex:toIndex];
    
}
@end
