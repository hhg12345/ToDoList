//
//  ChecklistsItem.h
//  Checklists
//
//  Created by 韩豪国 on 15-6-28.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject<NSCoding>
-(void) toggleChecked;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;
@end
