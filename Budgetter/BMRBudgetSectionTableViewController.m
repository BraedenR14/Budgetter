//
//  BMRBudgetSectionTableViewController.m
//  Budgetter
//
//  Created by braeden on 2015-08-07.
//  Copyright (c) 2015 braeden. All rights reserved.
//

#import "BMRBudgetSectionTableViewController.h"
#import "BMRBudgetSection.h"
#import "BMRBudgetSectionStore.h"

@interface BMRBudgetSectionTableViewController ()

@end

@implementation BMRBudgetSectionTableViewController
#pragma mark - Initializers
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.navigationItem.title = @"Budgetter";
        
        UIBarButtonItem *addSectionButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewSection:)];
        
        self.navigationItem.rightBarButtonItem = addSectionButton;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[BMRBudgetSectionStore sharedStore] allSections] count];
}

#pragma mark - Table Overrides
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSArray *sections = [[BMRBudgetSectionStore sharedStore] allSections];
    BMRBudgetSection *section = sections[indexPath.row];
    
    cell.textLabel.text = [section description];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSArray *allSections = [[BMRBudgetSectionStore sharedStore] allSections];
        
        BMRBudgetSection *sectionsToRemove = allSections[indexPath.row];
        
        [[BMRBudgetSectionStore sharedStore] removeSection:sectionsToRemove];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[BMRBudgetSectionStore sharedStore] moveSectionAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

// Override on selction
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *allItems = [[BMRBudgetSectionStore sharedStore] allSections];
    BMRBudgetSection *selectedItem = allItems[indexPath.row];
    
    // Set up BMRBudgteSection detail view
}

#pragma mark - Table Manipulation
-(IBAction)addNewSection:(id)sender
{
    BMRBudgetSection *section = [[BMRBudgetSectionStore sharedStore] createSection];
    
    NSInteger lastRow = [[[BMRBudgetSectionStore sharedStore] allSections] indexOfObject:section];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    
}

@end
