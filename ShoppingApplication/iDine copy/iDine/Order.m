//
//  Order.m
//  iDInein_ObjC
//
//  Created by Pavan Kumar on 17/09/20.
//  Copyright © 2020 Epam. All rights reserved.
//

#import "Order.h"

@implementation Order
static NSMutableArray *cartArray;

+ (NSMutableArray *)cartArray {
  if (cartArray == nil) {
    cartArray = [[NSMutableArray alloc] init];
  }
  return cartArray;
}

+(void)addItem:(MenuItem *)menuItem{
    BOOL isAlreadyAdded = false;
    if(cartArray.count > 0){
        for (int i=0; i<cartArray.count;i++){
            MenuItem *item = cartArray[i];
            if([item.menuItemID isEqualToString:menuItem.menuItemID]){
                //menuItem.quantity = menuItem.quantity + 1;
                isAlreadyAdded = true;
                break;
            }else{
                isAlreadyAdded = false;
            }
        }
    }
    
    if (isAlreadyAdded == false || cartArray.count == 0){
        [Order.cartArray addObject:menuItem];
    }
}
+(void)removeItem:(MenuItem *)removeItem{
    if(cartArray.count > 0){
        for (int i=0; i<cartArray.count;i++){
            MenuItem *item = cartArray[i];
            if([item.menuItemID isEqualToString:removeItem.menuItemID]){
                //removeItem.quantity = removeItem.quantity - 1;
                break;
            }
        }
        if(removeItem.quantity==0)
            [Order.cartArray removeObject:removeItem];
    }
}

+(double)totalOfOrders{
    double total=0;
    for (int i=0; i<cartArray.count;i++){
        MenuItem *item = cartArray[i];
        total += item.quantity  * item.price;
    }
    return total;
}


@end
