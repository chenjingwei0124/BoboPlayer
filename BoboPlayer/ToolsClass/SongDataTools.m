//
//  SongDataTools.m
//  BoboPlayer
//
//  Created by lanou on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SongDataTools.h"
#import "AppDelegate.h"
#import "SongData.h"
#import "SongDataBase.h"

@interface SongDataTools ()

@property (nonatomic, strong)NSManagedObjectContext *manageOC;
@end

@implementation SongDataTools

- (instancetype)init{
    self = [super init];
    if (self) {
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        self.manageOC = appDelegate.managedObjectContext;
    }
    return self;
}

- (void)addSongData:(SongDataBase *)songData{
    SongData *tempSongData = [NSEntityDescription insertNewObjectForEntityForName:@"SongData" inManagedObjectContext:self.manageOC];
    tempSongData.songName = songData.songName;
    tempSongData.songId = songData.songID;
    tempSongData.songAddress = songData.songAddress;
    tempSongData.singerId = songData.singerID;
    tempSongData.singerName = songData.singerName;
    tempSongData.albumId = songData.albumID;
    tempSongData.albumName = songData.albumName;
    tempSongData.numList = songData.numList;
    tempSongData.isCollect = songData.isCollect;
    
    [self.manageOC save:nil];
}

- (void)deleteSong:(SongData *)songData{
    [self.manageOC deleteObject:songData];
    [self.manageOC save:nil];
}

- (NSArray *)selectTotalSongArray{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"SongData"];
    NSPredicate *predic = [NSPredicate predicateWithFormat:@"numList CONTAINS '0'"];
    request.predicate = predic;
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"songName" ascending:YES];
    request.sortDescriptors = @[sort];
    return [self.manageOC executeFetchRequest:request error:nil];
}

- (NSArray *)selectCollectSongArray{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"SongData"];
    NSPredicate *predic = [NSPredicate predicateWithFormat:@"isCollect CONTAINS '1'"];
    request.predicate = predic;
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"songName" ascending:YES];
    request.sortDescriptors = @[sort];
    return [self.manageOC executeFetchRequest:request error:nil];
}

@end
