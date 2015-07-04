//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController<itemDetailViewControllerDelegate>

@property(nonatomic,strong)Checklist *checklist;

- (IBAction)addItem:(id)sender;

@end
