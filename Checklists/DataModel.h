//
//  DataModel.h
//  Checklists
//
//  Created by 韩豪国 on 15-7-11.
//  Copyright (c) 2015年 ioslearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong)NSMutableArray *lists;

-(void)saveChecklists;

@end
