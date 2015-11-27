//
//  clubViewController.h
//  FitnessClub
//
//  Created by 米老头 on 15/11/24.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface clubViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)kindButton:(UIButton *)sender forEvent:(UIEvent *)event;
- (IBAction)shopButton:(UIButton *)sender forEvent:(UIEvent *)event;
@property (weak, nonatomic) IBOutlet UIButton *kindBtn;
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;

@end
