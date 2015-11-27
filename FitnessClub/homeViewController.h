//
//  homeViewController.h
//  FitnessClub
//
//  Created by 米老头 on 15/11/24.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeTableViewCell.h"
#import "homeObject.h"
@interface homeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>




@property(strong,nonatomic) NSDictionary *parameters;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)dinwei:(UIBarButtonItem *)sender;
@property(strong,nonatomic) NSMutableArray *objectForShow;
@property(strong,nonatomic) NSMutableArray *mutArray;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnF;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnS;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnT;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnFo;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnFi;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnSi;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnSe;
@property (weak, nonatomic) IBOutlet UIButton *headerBtnNi;
@end
