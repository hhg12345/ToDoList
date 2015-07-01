//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistsItem.h"
@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController{
    NSMutableArray *_items;
}
- (void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistsItem *)item{

    if (item.checked == YES) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}
- (void)configureTextForCell:(UITableViewCell*)cell withChecklistItem:(ChecklistsItem *)item{
    UILabel *label = (UILabel*)[cell viewWithTag:1000];
    label.text = item.text;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _items = [[NSMutableArray alloc]initWithCapacity:20];
    ChecklistsItem *item;
    item = [ChecklistsItem new];
    item.text = @"000";
    item.checked = NO;
    [_items addObject:item];
    item = [ChecklistsItem new];
    item.text = @"111";
    item.checked = NO;
    [_items addObject:item];
    item = [ChecklistsItem new];
    item.text = @"222";
    item.checked = NO;
    [_items addObject:item];
    item = [ChecklistsItem new];
    item.text = @"333";
    item.checked = NO;
    [_items addObject:item];
    item = [ChecklistsItem new];
    item.text = @"444";
    item.checked = NO;
    [_items addObject:item];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    ChecklistsItem *item = _items[indexPath.row];
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    return cell;
}
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ChecklistsItem *item = _items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)addItem:(id)sender {
    NSInteger newRowIndex = [_items count];
    ChecklistsItem *item = [[ChecklistsItem alloc]init];
    item.text = @"This is a new item";
    item.checked = NO;
    [_items addObject:item];
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexpaths = @[indexpath];
    [self.tableView insertRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}
- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addItemViewController:(AddItemViewController*)controller didFinishAddingItem:(ChecklistsItem*)item{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddItem"]){
        UINavigationController *navigationController = segue.destinationViewController;
        AddItemViewController* controller = (AddItemViewController*)navigationController.topViewController;
        controller.delegate = self;
    }
}
@end
