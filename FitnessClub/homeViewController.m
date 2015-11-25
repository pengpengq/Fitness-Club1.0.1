//
//  homeViewController.m
//  FitnessClub
//
//  Created by 米老头 on 15/11/24.
//  Copyright © 2015年 milaotou. All rights reserved.
//

#import "homeViewController.h"

@interface homeViewController ()
{
    NSString *page;
    NSString *perPage;
    NSInteger loadcount;
}
@property(strong,nonatomic) NSMutableArray *objectForShow;
@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    page=@"1";
    perPage=@"10";
    NSString *request = @"/homepage/category";
    NSDictionary *para = @{@"page":@"1",@"perPage":@"10"};
    [RequestAPI getURL:request withParameters:para success:^(id responseObject) {
        NSLog(@"get responseObject = %@", responseObject);
        
        if ([[responseObject objectForKey:@"resultFlag"] integerValue]==8001){
            //根据接口返回的数据结构拆解数据，用适当的容器（数据类型）盛放底层数据
            NSDictionary *rootDictory=[responseObject objectForKey:@"result"];
            NSArray *dataArr=[rootDictory objectForKey:@"models"];
            NSLog(@"dic= %@",dataArr);
            NSDictionary *pageDict=[rootDictory objectForKey:@"pagingInfo"];
            if (loadcount==1) {
                _objectForShow=nil;
                _objectForShow=[NSMutableArray new];
            }
            
            for (NSDictionary *dic in dataArr) {
                homeObject *model=[[homeObject alloc] initWithDictionary:dic];
                
                [_objectForShow addObject:model];
            }
            [_tableView reloadData];
           NSInteger totalPage=[[pageDict objectForKey:@"totalPage"] integerValue];
            NSLog(@"%ld", (long)totalPage);

        }else{
            //[Utilities popUpAlertViewWithMsg:[responseObject objectForKey:@"resultFlag"] andTitle:nil];
            [Utilities popUpAlertViewWithMsg:[responseObject objectForKey:@"resultFlag"] andTitle:nil onView:nil];
        }

       
    } failure:^(NSError *error) {
        NSLog(@"get error = %@", error.description);
    }];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _objectForShow.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     homeTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    homeObject *object = [_objectForShow objectAtIndex:indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:object.backImgUrl] placeholderImage:[UIImage imageNamed:@""]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    homeObject *object=[_objectForShow objectAtIndex:indexPath.row ];
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    CGSize Size = CGSizeMake([[UIScreen mainScreen] bounds].size.width - 30, 1000);
    //CGSize imageV = [object. boundingRectWithSize:Size options:]
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
