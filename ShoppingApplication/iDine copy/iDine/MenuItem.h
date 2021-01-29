//
//  MenuItem.h
//  ImgPkr_WKWebview
//
//  Created by Pavan Kumar on 14/09/20.
//  Copyright © 2020 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuItem : NSObject
@property(nonatomic, retain) NSString *menuItemID;
@property(nonatomic, retain) NSString *menuname;
@property(nonatomic, retain) NSString *photoCredit;
@property int price;
@property int quantity;
@property(nonatomic, retain) NSMutableArray *restrictionsArray;
@property(nonatomic, retain) NSString *description;


@end
/*
"id": "36A7CC40-18C1-48E5-BCD8-3B42D43BEAEE",
              "name": "Stack-o-Pancakes",
              "photoCredit": "Joseph Gonzalez",
              "price": 8,
              "restrictions": ["D", "G", "V"],
              "description": "What do you get? Pancakes! How many do you get? One metric stack! That's equivalent to 1000 millistacks, or a tenth of a kilostack. In short, you get a lot of pancakes."
*/

NS_ASSUME_NONNULL_END
