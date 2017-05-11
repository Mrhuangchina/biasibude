//
//  HJMeCell.m
//  百思不得姐
//
//  Created by MrHuang on 17/1/13.
//  Copyright © 2017年 Mrhuang. All rights reserved.
//

#import "HJMeCell.h"

@implementation HJMeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.textColor = [UIColor darkGrayColor];
//        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.imageView.image == nil) return;
    
    self.imageView.HJ_y = SmallMargin;
    self.imageView.HJ_height = self.contentView.HJ_height - 2 *SmallMargin;
    self.imageView.HJ_width  = self.imageView.HJ_height;

    self.textLabel.HJ_x = self.imageView.HJ_right + Margin;
    

}
@end
