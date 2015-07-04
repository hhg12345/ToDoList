//
//  itemDetailViewController.h
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;
@protocol itemDetailViewControllerDelegate <NSObject>
-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController*)controller;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishAddingItem:(ChecklistItem*)item;
-(void)itemDetailViewController:(ItemDetailViewController*)controller didFinishEditingItem:(ChecklistItem*)item;
@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <itemDetailViewControllerDelegate> delegate;
@property(nonatomic,strong)ChecklistItem *itemToEdit;
@end
