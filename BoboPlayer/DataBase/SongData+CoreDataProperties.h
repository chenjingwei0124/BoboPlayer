//
//  SongData+CoreDataProperties.h
//  BoboPlayer
//
//  Created by lanou on 15/11/1.
//  Copyright © 2015年 陈警卫. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SongData.h"

NS_ASSUME_NONNULL_BEGIN

@interface SongData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *songName;
@property (nullable, nonatomic, retain) NSString *songId;
@property (nullable, nonatomic, retain) NSString *songAddress;
@property (nullable, nonatomic, retain) NSString *singerId;
@property (nullable, nonatomic, retain) NSString *singerName;
@property (nullable, nonatomic, retain) NSString *albumId;
@property (nullable, nonatomic, retain) NSString *albumName;
@property (nullable, nonatomic, retain) NSString *numList;
@property (nullable, nonatomic, retain) NSString *isCollect;

@end

NS_ASSUME_NONNULL_END
