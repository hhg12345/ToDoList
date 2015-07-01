//
//  AddItemViewController.h
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddItemViewController;
@class ChecklistsItem;
@protocol AddItemViewControllerDelegate <NSObject>
-(void)addItemViewControllerDidCancel:(AddItemViewController*)controller;
-(void)addItemViewController:(AddItemViewController*)controller didFinishAddingItem:(ChecklistsItem*)item;
@end

@interface AddItemViewController : UITableViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <AddItemViewControllerDelegate> delegate;
@end
