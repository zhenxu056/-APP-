//
//  SecondViewController.m
//  iOS-修改字体
//
//  Created by RuiTong_MAC on 17/2/24.
//  Copyright © 2017年 陈振旭. All rights reserved.
//

#import "SecondViewController.h"
#import "BaseLabel.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet BaseLabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _label.text = [NSString stringWithFormat:@"当前字号%f",_label.font.pointSize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _label.text = [NSString stringWithFormat:@"当前字号%f",_label.font.pointSize];
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

@end
