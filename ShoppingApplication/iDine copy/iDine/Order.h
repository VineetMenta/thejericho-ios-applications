//
//  Order.h
//  iDInein_ObjC
//
//  Created by Pavan Kumar on 17/09/20.
//  Copyright © 2020 Epam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface Order : NSObject
@property (class, nonatomic) NSMutableArray* cartArray;
+(void)addItem:(MenuItem *)menuItem;
+(void)removeItem:(MenuItem *)removeItem;
+(double)totalOfOrders;
@end

NS_ASSUME_NONNULL_END
