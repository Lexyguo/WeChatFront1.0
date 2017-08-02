//
//  User.m
//  ttest
//
//  Created by lexyguo on 2017/8/1.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithName:(NSString *)name chat:(NSString *)chat head:(NSString *)head{
    if(self=[super init]){
        _name=name;
        _chat=chat;
        _head=head;
    }
    return self;
}
+(NSArray *)demoData{
    User *first=[[User alloc] initWithName:@"树獭" chat:@"hello!" head:@"head3.png"];
    User *second=[[User alloc] initWithName:@"假酒少年和岁月静好的少女" chat:@"小马：早" head:@"group.png"];
    User *third=[[User alloc] initWithName:@"小布" chat:@"Yeah!" head:@"head1.png"];
    User *fourth=[[User alloc] initWithName:@"lexy" chat:@"o" head:@"myhead.png"];
    return @[first,second,third,fourth];
}
@end
