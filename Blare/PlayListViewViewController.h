//
//  PlayListViewViewController.h
//  Blare
//
//  Created by Aakash on 1/25/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@protocol PlayListViewDelegate;

@interface PlayListView : UIView <UITableViewDataSource,UITableViewDelegate>
    
    @property (assign) id <PlayListViewDelegate> playListViewDelegate;
    
    @end

@protocol PlayListViewDelegate <NSObject>
    
- (void)selectedPlayList:(MPMediaPlaylist*)playlist;
    
    @end
