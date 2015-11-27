//
//  modelpush.m
//  FitnessClub
//
//  Created by 米老头 on 15/11/26.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import "modelpush.h"

@implementation modelpush
+ (id)pushgetStoryboard:(NSString *)Identity
    {
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UINavigationController *navigation=[UINavigationController new];
        UIViewController *view=[UIViewController new];
        [storyboard instantiateViewControllerWithIdentifier:Identity];
        [navigation pushViewController:view  animated:YES];
        return  navigation;
    }

@end
