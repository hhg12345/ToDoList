//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
@interface ChecklistsViewController : UITableViewController<itemDetailViewControllerDelegate>
- (IBAction)addItem:(id)sender;

@end
