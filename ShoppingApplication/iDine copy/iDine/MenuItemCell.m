//
//  FriendTableCell.m
//  CustomFavoriteFriends
//
//  Created by macOS Catalina on 25/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import "MenuItemCell.h"

@interface MenuItemCell ()

@end

@implementation MenuItemCell

@synthesize nameLabel, thumbnailImage, addButton, removeButton, itemCountLabel, priceLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
