//
//  AppDelegate.m
//  ttest
//
//  Created by lexyguo on 2017/7/24.
//  Copyright © 2017年 lexyguo. All rights reserved.
//

#import "contectViewController.h"
#import "TestViewController.h"
#import "findViewController.h"
#import "meViewController.h"
#import "AppDelegate.h"
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define kUIColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kScaleW  SCREEN_WIDTH/375.0     // 4.7屏幕宽度尺寸比例
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor clearColor];
    self.tb=[[UITabBarController alloc] init];
    self.window.rootViewController=self.tb;
    self.tb.tabBar.backgroundColor=[UIColor whiteColor];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    [self MainLoadView];
    [self.window makeKeyAndVisible];
    return YES;
}
-(UILabel *)NavigationTitle:(NSString *)TitleText{
    UILabel *title=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.backgroundColor=[UIColor clearColor];
    title.textColor=[UIColor whiteColor];
    title.font=[UIFont boldSystemFontOfSize:20];
    title.textAlignment=UITextAlignmentCenter;
    title.text=TitleText;
    return title;
}
-(void)customTabBar{//加载自定义的图片
    UITabBar *tabBar=self.tb.tabBar;
    UITabBarItem *tabBarItem0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:3];


    tabBarItem0.image = [[UIImage imageNamed:@"wechat-close.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem0.selectedImage = [[UIImage imageNamed:@"wechat-open.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem0.title=@"微信";
    
    tabBarItem1.image = [[UIImage imageNamed:@"contact-close.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"contact-open.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.title=@"通讯录";
    
    tabBarItem2.image = [[UIImage imageNamed:@"find-close.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"find-open.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem2.title=@"发现";
    
    tabBarItem3.image = [[UIImage imageNamed:@"me-close.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"me-open.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem3.title=@"我";
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       kUIColorFromRGB(0x7a7e83), NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                      kUIColorFromRGB(0x1aad19), NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
}
-(void)MainLoadView{
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
    
    TestViewController *c1=[[TestViewController alloc] init];
    UINavigationController *nb1=[[UINavigationController alloc]initWithRootViewController:c1];
    //wx.tabBarItem.title=@"message";
    //wx.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    c1.navigationItem.titleView=[self NavigationTitle:@"微信"];
  
    contectViewController *c2=[[contectViewController alloc] init];
    UINavigationController *nb2=[[UINavigationController alloc]initWithRootViewController:c2];
    c2.navigationItem.titleView=[self NavigationTitle:@"通讯录"];
    
    findViewController *c3=[[findViewController alloc] init];
    UINavigationController *nb3=[[UINavigationController alloc]initWithRootViewController:c3];
    c3.navigationItem.titleView=[self NavigationTitle:@"发现"];
    
    
    meViewController *c4=[[meViewController alloc] init];
    UINavigationController *nb4=[[UINavigationController alloc]initWithRootViewController:c4];
    c4.navigationItem.titleView=[self NavigationTitle:@"我"];
    
    self.tb.viewControllers=@[nb1,nb2,nb3,nb4];
    [self customTabBar];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
