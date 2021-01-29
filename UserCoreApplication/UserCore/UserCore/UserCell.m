//
//  UserCell.m
//  UserCore
//
//  Created by macOS Catalina on 11/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//
#import "UserCell.h"

@implementation UserCell
@synthesize emailLbl,usernameLbl,profilePic;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
