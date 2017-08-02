//
//  User.h
//  ttest
//
//  Created by lexyguo on 2017/8/1.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *head;
@property (nonatomic, copy) NSString *chat;

- (instancetype)initWithName:(NSString *)name
                        chat:(NSString *)chat
                        head:(NSString *)head;

+ (NSArray *)demoData;

@end
