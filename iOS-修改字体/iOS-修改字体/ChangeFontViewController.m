//
//  ChangeFontViewController.m
//  iOS-动态修改字体
//
//  Created by RuiTong_MAC on 17/2/21.
//  Copyright © 2017年 陈振旭. All rights reserved.
//

#import "ChangeFontViewController.h"

@interface ChangeFontViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *arr;

@end

@implementation ChangeFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *themePath = [[NSBundle mainBundle] pathForResource:@"fontList" ofType:@"plist"];
    NSDictionary *themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
    _arr = [themesPlist allKeys];
}

#pragma mark -- UITableViewDataSource, UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndex" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _arr[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *themePath = [[NSBundle mainBundle] pathForResource:@"fontList" ofType:@"plist"];
    NSDictionary *themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];

    NSNumber *num = [themesPlist objectForKey:_arr[indexPath.row]];
    [userDefault setObject:num forKey:@"Font"];
    NSLog(@"%@   %@",_arr[indexPath.row], num);
    
    NSDictionary *dict =@{@"font":@1};
    NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
     
}

- (IBAction)removeUD:(UIButton *)sender {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [userDefault objectForKey:@"Font"];
    NSLog(@"取出%f",[num floatValue]);
//    
    NSDictionary *dict =@{@"font":num};
    
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
