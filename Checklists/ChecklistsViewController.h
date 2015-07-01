//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"
@interface ChecklistsViewController : UITableViewController<AddItemViewControllerDelegate>
- (IBAction)addItem:(id)sender;

@end
