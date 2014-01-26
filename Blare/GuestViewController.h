//
//  GuestViewController.h
//  Blare
//
//  Created by Aakash on 1/25/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayListViewViewController.h"

@import MediaPlayer;
@import MultipeerConnectivity;
@import AVFoundation;

#import "HostViewController.h"
#import "TDMultipeerHostViewController.h"
#import "TDAudioStreamer.h"
#import "TDSession.h"

    

    
    
@interface GuestViewController : UIViewController <MPMediaPickerControllerDelegate,PlayListViewDelegate>{
    
    
        
    IBOutlet UIButton *playPauseButton;
        IBOutlet  UIButton *_playPauseButton;
        
        IBOutlet  UILabel *_currentlyPlayingSong;
        
        IBOutlet  UITableView *_songTableView;
        
        IBOutlet  UISlider *_volumeSlider;
        
        MPMediaItemCollection	*_userMediaItemCollection;
        
        PlayListView *_playListView;
        
        
    }
    
    @property (nonatomic,strong) MPMusicPlayerController *musicPlayer;
    @property (strong, nonatomic) MPMediaItem *song;
    @property (strong, nonatomic) TDAudioOutputStreamer *outputStreamer;
    @property (strong, nonatomic) TDSession *session;
    @property (strong, nonatomic) AVPlayer *player;
    
- (IBAction)playPauseAction:(id)sender;
    
- (IBAction)playPauseMusic:(id)sender;
- (IBAction)playNextSongInList:(id)sender;
- (IBAction)playPreviousSongInList:(id)sender;
- (IBAction)repeatSongList:(id)sender;
- (IBAction)shuffleSongList:(id)sender;
- (IBAction)changeVolume:(id)sender;
- (IBAction)selectSongs:(id)sender;
- (IBAction)selectPlayList:(id)sender;
    
- (void)removeMusicPlayerObserver;
- (void)addMusicPlayerObserver;
- (void)initializeMusicPlayer;
- (void)clearMusicList;
    
- (void)updateTheMediaColledtionsItems:(MPMediaItemCollection *)mediaItemCollection;
    
    @end
