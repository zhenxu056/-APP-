//
//  FontTableViewCell.m
//  iOS-动态修改字体
//
//  Created by RuiTong_MAC on 17/2/21.
//  Copyright © 2017年 陈振旭. All rights reserved.
//

#import "FontTableViewCell.h"

@implementation FontTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)cofCell:(NSIndexPath *)indexPath {
   self.titleLabel.text = [NSString stringWithFormat:@"第%ld个，当前字号%f。", (long)indexPath.row, self.titleLabel.font.pointSize];
}


@end
