//
//  MV.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MV.h"
#import "MVList.h"

@implementation MV
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if ([key isEqual:@"id"]) {
        
        self.ID = value;
        
    }
    if ([key isEqual:@"mvList"]) {
        for (NSDictionary *ddd in value) {
            MVList *mvList = [[MVList alloc]init];
            [mvList setValuesForKeysWithDictionary:ddd];
            self.mvlist = mvList;
            
        }
    }
    
    
    
}
@end
