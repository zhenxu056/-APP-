//
//  FontTableViewCell.h
//  iOS-动态修改字体
//
//  Created by RuiTong_MAC on 17/2/21.
//  Copyright © 2017年 陈振旭. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseLabel.h"

@interface FontTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet BaseLabel *titleLabel;

- (void)cofCell:(NSIndexPath *)indexPath;

@end
