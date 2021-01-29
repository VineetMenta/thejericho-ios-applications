//
//  MenuSection.h
//  ImgPkr_WKWebview
//
//  Created by Pavan Kumar on 14/09/20.
//  Copyright © 2020 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuSection : NSObject
@property(nonatomic,retain) NSString *menuID;
@property(nonatomic,retain) NSString *menuName;
@property(nonatomic,retain) NSMutableArray *items;

/*
 "id":"EF1CC5BB-4785-4D8E-AB98-5FA4E00B6A66",
      "name":"Breakfast",
      "items"
 */
@end

NS_ASSUME_NONNULL_END
