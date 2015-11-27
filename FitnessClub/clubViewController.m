//
//  clubViewController.m
//  FitnessClub
//
//  Created by 米老头 on 15/11/24.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import "clubViewController.h"

@interface clubViewController ()
- (IBAction)dinwei:(UIBarButtonItem *)sender;
- (IBAction)nearby:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *search;
@end

@implementation clubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)dinwei:(UIBarButtonItem *)sender {
    
    UIViewController *view = [Utilities getStoryboardInstance:@"Main" byIdentity:@"cities"];
    
    
    [self.navigationController pushViewController:view  animated:YES];
    //描述：通过 NSNavigationBar 进行跳转
    
    //[self.navigationController popViewControllerAnimated:];
}

- (IBAction)nearby:(UIBarButtonItem *)sender {
}

- (IBAction)kindButton:(UIButton *)sender forEvent:(UIEvent *)event {
}

- (IBAction)shopButton:(UIButton *)sender forEvent:(UIEvent *)event {
}
@end
