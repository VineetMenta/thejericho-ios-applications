//
//  UserCell.h
//  UserCore
//
//  Created by macOS Catalina on 11/10/20.
//  Copyright © 2020 com.jericho. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserCell : UITableViewCell
@property(nonatomic,strong) IBOutlet UILabel *emailLbl;
@property(nonatomic,strong) IBOutlet UILabel *usernameLbl;
@property(nonatomic,strong) IBOutlet UIImageView *profilePic;

@end

NS_ASSUME_NONNULL_END
