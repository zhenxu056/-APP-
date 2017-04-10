//
//  ViewController.m
//  iOS-修改字体
//
//  Created by RuiTong_MAC on 17/2/22.
//  Copyright © 2017年 陈振旭. All rights reserved.
//

#import "ViewController.h"
#import "ChangeFontViewController.h"
#import "FontTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    _count = 100;
    
    
    //如果需要更新页面数据，可以使用与基类相同的通知
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(themeNotification:)
     name:@"tongzhi" object:nil];
}


#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    [_tableView reloadData];
}

- (void)dealloc {
     [[NSNotificationCenter defaultCenter] removeObserver:self name:@"tongzhi" object:nil];
}

#pragma mark -- UITableViewDataSource, UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FontTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FontTableViewCell" forIndexPath:indexPath];
    [cell cofCell:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"changeFont" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"changeFont"]) {
        
    }
}

@end
