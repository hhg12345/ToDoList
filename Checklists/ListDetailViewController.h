//
//  ListDetailViewController.h
//  Checklists
//
//  Created by 韩豪国 on 15-7-4.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListDetailViewController;
@class Checklist;

@protocol ListDetailViewControllerDelegate <NSObject>

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist*)checklist;
-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist*)checklist;

@end

@interface ListDetailViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <ListDetailViewControllerDelegate> delegate;
@property(nonatomic,strong)Checklist *checklistToEdit;

@end
