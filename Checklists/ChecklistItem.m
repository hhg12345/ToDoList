//
//  ChecklistsItem.m
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem
-(void)toggleChecked{
    self.checked = !self.checked;
}
@end
