//
//  homeViewController.h
//  FitnessClub
//
//  Created by 米老头 on 15/11/24.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property(strong,nonatomic) NSDictionary *parameters;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
