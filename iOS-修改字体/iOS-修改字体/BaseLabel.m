//
//  BaseLabel.m
//  iOS-修改字体
//
//  Created by RuiTong_MAC on 17/2/23.
//  Copyright © 2017年 陈振旭. All rights reserved.
//

#import "BaseLabel.h"

@interface BaseLabel ()

@property (assign, nonatomic) CGFloat fontSize;

@end

@implementation BaseLabel

- (id)init {
    self = [super init];
    if (self != nil) {
        NSLog(@"我出现了 init ");
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(themeNotification:)
         name:@"tongzhi" object:nil];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        NSLog(@"我出现了 initWithCoder");
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [userDefault objectForKey:@"Font"];
    CGFloat font = self.font.pointSize;
    self.font = [UIFont systemFontOfSize:font + [num floatValue]];
    
    
    self.fontSize = font;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(themeNotification:)
     name:@"tongzhi" object:nil];
    
    NSLog(@"我出现了 awakeFromNib   %f",self.fontSize);
}



#pragma mark - NSNotification Actions
- (void)themeNotification:(NSNotification *)notification {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSNumber *num = [userDefault objectForKey:@"Font"]; 
    self.font = [UIFont systemFontOfSize:self.fontSize + [num floatValue]];
}

#pragma mark - Memery Manager
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"tongzhi" object:nil];
}
@end
