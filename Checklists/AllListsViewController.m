//
//  AllListsViewController.m
//  Checklists
//
//  Created by 韩豪国 on 15-7-4.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "AllListsViewController.h"
#import "Checklist.h"
#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "DataModel.h"

@interface AllListsViewController ()

@end

@implementation AllListsViewController

//-(NSString*)documentsDirectory{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths firstObject];
//    return documentsDirectory;
//}
//
//-(NSString*)dataFilePath{
//    return [[self documentsDirectory]stringByAppendingPathComponent:@"Checklists.plist"];
//}
//
//-(void)saveChecklists{
//    NSMutableData *data = [[NSMutableData alloc]init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    [archiver encodeObject:_lists forKey:@"Checklists"];
//    [archiver finishEncoding];
//    [data writeToFile:[self dataFilePath] atomically:YES];
//}
//
//-(void)loadChecklists{
//    NSString *path = [self dataFilePath];
//    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
//        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
//        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
//        _lists = [unarchiver decodeObjectForKey:@"Checklists"];
//        [unarchiver finishDecoding];
//    }else{
//        _lists = [[NSMutableArray alloc]initWithCapacity:20];
//    }
//}

//- (id)initWithCoder:(NSCoder *)aDecoder{
//    if ((self = [super initWithCoder:aDecoder])) {
////        _lists = [[NSMutableArray alloc]initWithCapacity:20];
////        Checklist *list;
////        list = [[Checklist alloc]init];
////        list.name = @"娱乐";
////        [_lists addObject:list];
////        
////        list = [[Checklist alloc]init];
////        list.name = @"工作";
////        [_lists addObject:list];
////        
////        list = [[Checklist alloc]init];
////        list.name = @"学习";
////        [_lists addObject:list];
////        
////        list = [[Checklist alloc]init];
////        list.name = @"家庭";
////        [_lists addObject:list];
////        
////        for (Checklist *list in _lists) {
////            ChecklistItem *item = [[ChecklistItem alloc]init];
////            item.text = [NSString stringWithFormat:@"Item for:%@",list.name];
////        }
//        [self loadChecklists];
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [self.dataModel.lists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ChecklistViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    }else if ([segue.identifier isEqualToString:@"AddChecklist"]){
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//delegate方法，Add进入，Done按钮触发
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist*)checklist{
    NSInteger newRowIndex = [self.dataModel.lists count];
    [self.dataModel.lists addObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    //写入文件
    //[self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//delegate方法，Edit进入，Done按钮触发
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist*)checklist{
    NSInteger index = [self.dataModel.lists indexOfObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    //[self configureTextForCell:cell withChecklistItem:item];
    //写入文件
    //[self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    controller.checklistToEdit = checklist;
    
    [self presentViewController:navigationController animated:YES completion:nil];
}


                                                    
                                                    
@end
