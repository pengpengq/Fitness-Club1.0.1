//
//  homeObject.m
//  FitnessClub
//
//  Created by 米老头 on 15/11/25.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import "homeObject.h"

@implementation homeObject
- (id)initWithDictionary:(NSDictionary *)dic {
    
   _backImgUrl = [[dic objectForKey:@"backImgUrl"] isKindOfClass:[NSNull class]] ? @"":[dic objectForKey:@"backImgUrl"];
    return self;
}
@end
