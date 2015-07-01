//
//  AddItemViewController.m
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "AddItemViewController.h"
#import "ChecklistsItem.h"
@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

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


- (IBAction)cancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(id)sender {
//    NSLog(@"当前文本框中的内容为%@",self.textField.text);
    ChecklistsItem *item= [[ChecklistsItem alloc]init];
    item.text = self.textField.text;
    item.checked = NO;
    [self.delegate addItemViewController:self didFinishAddingItem:item];
//    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([newText length]>0) {
        self.doneBarButton.enabled = YES;
    }else{
        self.doneBarButton.enabled = NO;
    }
    return YES;
}
@end
