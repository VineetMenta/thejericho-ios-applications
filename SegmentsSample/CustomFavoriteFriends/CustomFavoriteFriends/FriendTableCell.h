//
//  FriendTableCell.h
//  CustomFavoriteFriends
//
//  Created by macOS Catalina on 25/09/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UIButton *addButton;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImage;

@end

NS_ASSUME_NONNULL_END
