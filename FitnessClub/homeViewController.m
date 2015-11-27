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
    NSInteger loadcount;

}
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //[self request];
    
    CGRect rect = _headerView.frame;
    rect.size.height = (UI_SCREEN_W - 130.f) / 2 + 85.f;
    _headerView.frame = rect;
    [self request];
    
    //[self secondrequestData];
        // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    //[self.navigationController setNavigationBarHidden:YES animated:YES];
   
    
}
-(void)request{
    NSString *request = @"/homepage/category";
    NSDictionary *para = @{@"page":@"1",@"perPage":@"10"};
    [RequestAPI getURL:request withParameters:para success:^(id responseObject) {
        NSLog(@"get responseObject = %@", responseObject);
        
        if ([[responseObject objectForKey:@"resultFlag"] integerValue]==8001){
            //根据接口返回的数据结构拆解数据，用适当的容器（数据类型）盛放底层数据
            NSDictionary *rootDictory=[responseObject objectForKey:@"result"];
            NSArray *dataArr=[rootDictory objectForKey:@"models"];
            //NSLog(@"dic= %@",dataArr);
            NSDictionary *pageDict=[rootDictory objectForKey:@"pagingInfo"];
            //_headerBtnF.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageWithData:data]];
            for (NSDictionary *dic in dataArr) {
                homeObject *model=[[homeObject alloc] initWithDictionary:dic];
                [_objectForShow addObject:model];
            }
            
           
            
            _headerBtnF.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            _headerBtnT.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            _headerBtnS.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            _headerBtnFo.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            _headerBtnFi.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            _headerBtnSi.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            _headerBtnSe.layer.cornerRadius=_headerBtnF.frame.size.width/2;
             _headerBtnNi.layer.cornerRadius=_headerBtnF.frame.size.width/2;
            
            
            [_headerBtnF setImage:_objectForShow[0] forState:UIControlStateHighlighted];
            NSInteger totalPage=[[pageDict objectForKey:@"totalPage"] integerValue];
            NSLog(@"%ld", (long)totalPage);
            
        }else{
            //[Utilities popUpAlertViewWithMsg:[responseObject objectForKey:@"resultFlag"] andTitle:nil];
            [Utilities popUpAlertViewWithMsg:[responseObject objectForKey:@"resultFlag"] andTitle:nil onView:nil];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"get error = %@", error.description);
    }];

}
-(void)secondrequestData{
    NSString *request = @"/homepage/choice";
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"page",@"13",@"perPage",@"0510",@"city",@"120.31",@"jing",@"31.49",@"wei",nil];
    [RequestAPI getURL:request withParameters:parameters success:^(id responseObject) {
        NSLog(@"get responseObject = %@", responseObject);
        if ([[responseObject objectForKey:@"resultFlag"] integerValue]==8001){
            //根据接口返回的数据结构拆解数据，用适当的容器（数据类型）盛放底层数据
            NSDictionary *rootDictory=[responseObject objectForKey:@"result"];
            NSArray *dataArr=[rootDictory objectForKey:@"models"];
            NSDictionary *pageDict=[rootDictory objectForKey:@"pagingInfo"];
            if (loadcount==0) {
                _mutArray=nil;
                _mutArray=[NSMutableArray new];
            }
            
            for (NSDictionary *dic in dataArr) {
                homeObject *model=[[homeObject alloc] initWithDictionary:dic];
                
                [_mutArray addObject:model];
                NSLog(@"_mutArray%@",_mutArray);
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
    
    return _mutArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     homeTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    homeObject *object = [_mutArray objectAtIndex:indexPath.row];
    NSLog(@"object=%@",object);
    [cell.cellImageV sd_setImageWithURL:[NSURL URLWithString:object.ImgUrl] placeholderImage:[UIImage imageNamed:@"default"]];
    
    cell.nameLabel.text=object.name;
    cell.detailsLabel.text=object.detail;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UI_SCREEN_W / 2;

    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)dinwei:(UIBarButtonItem *)sender {
    
    
   UIViewController *view= [Utilities getStoryboardInstanceByIdentity:@"cities"];
  [self.navigationController pushViewController:view  animated:YES];
    
    
    
    }

@end
