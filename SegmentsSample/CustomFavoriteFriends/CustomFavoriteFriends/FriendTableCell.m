//
//  FriendTableCell.m
//  CustomFavoriteFriends
//
//  Created by macOS Catalina on 25/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "FriendTableCell.h"

@interface FriendTableCell ()

@end

@implementation FriendTableCell

@synthesize nameLabel = _nameLabel;
@synthesize addButton = _addButton;
@synthesize thumbnailImage = _thumbnailImage;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
