//
//  MvvmViewController.m
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "MvvmViewController.h"
#import "MvvmModelF.h"
#import "MvvmModel.h"
#import "MvvmViewControllerCell.h"

@interface MvvmViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *data;
@property(nonatomic,assign)NSUInteger currentPage;

@end

@implementation MvvmViewController

- (NSMutableArray *)data
{
    if (_data == nil) {
        
        _data = [[NSMutableArray alloc] init];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试界面";
    
    // 初始化变量
    [self initVar];
    
    // 初始化TableView
    [self setUpTableView];
    
    // 获取卡数据网络请求
    [self networkRequestCardData];
}

#pragma mark -初始化变量

- (void)initVar {
    
    _data = [[NSMutableArray alloc] init];
    
}

#pragma mark -初始化TableView

- (void)setUpTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

#pragma mark -获取卡数据网络请求

- (void)networkRequestCardData {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@"134962" forKey:@"user_id"];
    [params setObject:[NSString stringWithFormat:@"%zd",_currentPage] forKey:@"p"];
    
    [CESHttpTool GET:@"m=Card&a=user_card_list" parameters:params success:^(id responseObject) {
        
        NSInteger res  = [[responseObject objectForKey:@"res"]integerValue];
        
        if (res == 0) {
            
            NSArray *arr = [responseObject objectForKey:@"data"];
            
            // 模型转换视图模型 MvvmModel -> MvvmModelF
           
            for (MvvmModel *mvvmModel in arr) {
                
                MvvmModelF *modelF = [[MvvmModelF alloc] init];
                
                modelF.model = [MvvmModel mj_objectWithKeyValues:mvvmModel];
                
                [self.data addObject:modelF];
            }
    
            [self.tableView reloadData];
        }
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
}

#pragma mark -UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取MvvmModelF模型
    MvvmModelF *modelF = self.data[indexPath.row];
    
    return modelF.cellHeight;    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MvvmViewControllerCell *cell = [MvvmViewControllerCell cellWithTableView:tableView];
    
    MvvmModelF *modelF = self.data[indexPath.row];
    
    cell.modelF = modelF;
    
    return cell;
    
}

@end
