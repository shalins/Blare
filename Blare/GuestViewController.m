//
//  GuestViewController.m
//  Blare
//
//  Created by Aakash on 1/25/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//

#import "GuestViewController.h"

@import MediaPlayer;

//#import "TDMultipeerGuestViewController.h"
#import "TDSession.h"
#import "TDAudioStreamer.h"

@interface GuestViewController () <TDSessionDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *songTitle;
@property (weak, nonatomic) IBOutlet UILabel *songArtist;

//@property (strong, nonatomic) TDSession *session;

@property (strong, nonatomic) TDAudioInputStreamer *inputStream;

@end



@implementation GuestViewController
    
    

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.session stopAdvertising];
}

- (void)changeSongInfo:(NSDictionary *)info
{
    if (info[@"artwork"])
        self.albumImage.image = info[@"artwork"];
    else
        self.albumImage.image = nil;
    
    self.songTitle.text = info[@"title"];
    self.songArtist.text = info[@"artist"];
}

#pragma mark - TDSessionDelegate

- (void)session:(TDSession *)session didReceiveData:(NSData *)data
{
    NSDictionary *info = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [self performSelectorOnMainThread:@selector(changeSongInfo:) withObject:info waitUntilDone:NO];
}

- (void)session:(TDSession *)session didReceiveAudioStream:(NSInputStream *)stream
{
    if (!self.inputStream) {
        self.inputStream = [[TDAudioInputStreamer alloc] initWithInputStream:stream];
        [self.inputStream start];
    }
}


- (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Release any cached data, images, etc that aren't in use.
    }
    
#pragma mark - View lifecycle
    
- (void)viewDidLoad
    {
        //        NSString *imageBG = @"MainMenuBG.png";
        //        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"MainMenuBG.png"]]];
        //        CGRect screenRect = [[UIScreen mainScreen] bounds];
        //        if (screenRect.size.height == 568.0f)
        //        imageBG = [imageBG stringByReplacingOccurrencesOfString:@".png" withString:@"-568h.png"];
        //
        //
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed: @"NavBarBG.png"] forBarMetrics: UIBarMetricsDefault];
        
        
        //Set navBar image programatically    (NavBar.png replace with the image)
        //    UIImage *navBarImage = [UIImage imageNamed:@"NavBarBG.png"];
        //    [[UINavigationBar appearance]setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
        //
        [super viewDidLoad];
        //[self initializeMusicPlayer];
        
       // [self addMusicPlayerObserver];
        
        [super viewDidLoad];
        
        self.session = [[TDSession alloc] initWithPeerDisplayName:[[UIDevice currentDevice] name]];
        //[self.session startAdvertisingForServiceType:@"dance-party" discoveryInfo:nil];
        [self presentViewController:[self.session browserViewControllerForSeriviceType:@"dance-party"] animated:YES completion:nil];
        
        self.session.delegate = self;
        
        // Do any additional setup after loading the view, typically from a nib.
    }





#pragma mark - TDSessionDelegate


    
- (void)viewDidUnload
    {
        [super viewDidUnload];
        // Release any retained subviews of the main view.
        // e.g. self.myOutlet = nil;
        
        [self removeMusicPlayerObserver];
        
    }
    
- (void)viewWillAppear:(BOOL)animated
    {
        [super viewWillAppear:animated];
    }
    
- (void)viewDidAppear:(BOOL)animated
    {
        [super viewDidAppear:animated];
    }
    
- (void)viewWillDisappear:(BOOL)animated
    {
        [super viewWillDisappear:animated];
    }
    

    
//    
//    
//#pragma mark Music Player
//    
//- (void)initializeMusicPlayer {
//    
//    self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
//    
//    [self.musicPlayer setShuffleMode:MPMusicShuffleModeOff];
//    
//    [self.musicPlayer setRepeatMode:MPMusicRepeatModeNone];
//    
//}
//    
//    
//#pragma Add observer to Music Player state Notifications
//    
//- (void)addMusicPlayerObserver {
//    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleNowPlayingSongStateChanged:)
//                                                 name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
//                                               object:self.musicPlayer];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handlePlaybackStateChanged:)
//                                                 name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
//                                               object:self.musicPlayer];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(handleVolumeChangedFromOutSideApp:)
//                                                 name:MPMusicPlayerControllerVolumeDidChangeNotification
//                                               object:self.musicPlayer];
//    [self.musicPlayer beginGeneratingPlaybackNotifications];
//}
//    
//    
//#pragma Remove obsever for Music Player Notifications
//    
//- (void)removeMusicPlayerObserver {
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
//                                                  object:self.musicPlayer];
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
//                                                  object:self.musicPlayer];
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:MPMusicPlayerControllerVolumeDidChangeNotification
//                                                  object:self.musicPlayer];
//    
//    [self.musicPlayer endGeneratingPlaybackNotifications];
//}
//    
//#pragma Music player Notification selectors
//    
//- (void)handleNowPlayingSongStateChanged:(id)notification {
//    
//    
//    NSLog(@"handleNowPlayingSongStateChanged");
//    
//    MPMediaItem *currentItem = self.musicPlayer.nowPlayingItem;
//    
//    _currentlyPlayingSong.text = [currentItem valueForProperty:MPMediaItemPropertyTitle];
//    
//}
//    
//    
//- (void)handlePlaybackStateChanged:(id)notification {
//    
//    NSLog(@"handlePlaybackStateChanged");
//    
//    MPMusicPlaybackState playbackState = self.musicPlayer.playbackState;
//    
//    if (playbackState == MPMusicPlaybackStateStopped || playbackState == MPMusicPlaybackStatePaused) {
//        
//        [self.musicPlayer play];
//        
//        [_playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
//        
//    } else if (playbackState == MPMusicPlaybackStatePlaying) {
//        
//        [self.musicPlayer pause];
//        
//        [_playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
//    }
//    
//}
//
//
//- (void)handleVolumeChangedFromOutSideApp:(id)notification {
//    
//    NSLog(@"handleVolumeChangedFromOutSideApp");
//    
//    [_volumeSlider setValue:self.musicPlayer.volume animated:YES];
//    
//}
//    
//#pragma Music Player Controls Methods
//    
//    
//- (IBAction)playPauseMusic:(id)sender {
//    
//    MPMusicPlaybackState playbackState = self.musicPlayer.playbackState;
//    
//	if (playbackState == MPMusicPlaybackStateStopped || playbackState == MPMusicPlaybackStatePaused) {
//        
//		[self.musicPlayer play];
//        
//        [_playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
//        
//	} else if (playbackState == MPMusicPlaybackStatePlaying) {
//        
//        [self.musicPlayer pause];
//        
//        [_playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
//    }
//    
//    
//}
//    
//- (IBAction)playNextSongInList:(id)sender {
//    
//    [self.musicPlayer skipToNextItem];
//    
//}
//    
//- (IBAction)playPreviousSongInList:(id)sender {
//    
//    static NSTimeInterval skipToBeginningOfSongIfElapsedTimeLongerThan = 3.5;
//    
//    NSTimeInterval playbackTime = self.musicPlayer.currentPlaybackTime;
//    if (playbackTime <= skipToBeginningOfSongIfElapsedTimeLongerThan) {
//        
//        [self.musicPlayer skipToPreviousItem];
//        
//    } else {
//        
//        [self.musicPlayer skipToBeginning];
//    }
//}
//    
//- (IBAction)repeatSongList:(id)sender {
//    
//    
//    if (self.musicPlayer.repeatMode == MPMusicRepeatModeNone ) {
//        
//        [self.musicPlayer setRepeatMode:MPMusicRepeatModeAll];
//        
//        [sender setTitle:@"YES" forState:UIControlStateNormal];
//        
//    }
//    else {
//        
//        [self.musicPlayer setRepeatMode:MPMusicRepeatModeNone];
//        
//        [sender setTitle:@"NO" forState:UIControlStateNormal];
//    }
//    
//    
//}
//    
//- (IBAction)shuffleSongList:(id)sender {
//    
//    if (self.musicPlayer.shuffleMode == MPMusicShuffleModeOff ) {
//        
//        [self.musicPlayer setShuffleMode:MPMusicShuffleModeSongs];
//        
//        [sender setTitle:@"YES" forState:UIControlStateNormal];
//        
//    }
//    else {
//        
//        [self.musicPlayer setShuffleMode:MPMusicShuffleModeOff];
//        
//        [sender setTitle:@"NO" forState:UIControlStateNormal];
//        
//    }
//    
//}
//    

- (IBAction)changeVolume:(id)sender {
    
    self.musicPlayer.volume = _volumeSlider.value;
    
}
//    
//    
//- (IBAction)selectSongs:(id)sender {
//    
//    MPMediaPickerController *mediaPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeAny];
//    
//    mediaPicker.delegate = self;
//    
//    [self presentModalViewController:mediaPicker animated:YES];
//    
//}
//    
//- (IBAction)selectPlayList:(id)sender {
//    
//    _playListView = [[PlayListView alloc] initWithFrame:CGRectMake(0,0, 320, 460)];
//    
//    [_playListView setPlayListViewDelegate:self];
//    
//    [self.view addSubview:_playListView];
//    
//}
//    
//    
//- (void)clearMusicList
//    {
//        
//        MPMediaPropertyPredicate *predicate =
//        
//        [MPMediaPropertyPredicate predicateWithValue: @"NoSongsName"
//                                         forProperty:MPMediaItemPropertyTitle];
//        MPMediaQuery *mediaquery = [[MPMediaQuery alloc] init];
//        
//        [mediaquery addFilterPredicate:predicate];
//        
//        [self.musicPlayer setQueueWithQuery:mediaquery];
//        
//        self.musicPlayer.nowPlayingItem = nil;
//        
//        [self.musicPlayer stop];
//        
//        _userMediaItemCollection = nil;
//        
//        [_songTableView reloadData];
//    }
//    
//    
//#pragma mark MPMediaPickerController delegate methods
//    
//- (void)mediaPicker: (MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
//    {
//        
//        [self dismissModalViewControllerAnimated:YES];
//        
//        [self updateTheMediaColledtionsItems:mediaItemCollection];
//        
//        
//    }
//    
//    
//- (void)updateTheMediaColledtionsItems:(MPMediaItemCollection *)mediaItemCollection {
//    
//    if (_userMediaItemCollection == nil) {
//        
//        _userMediaItemCollection = mediaItemCollection;
//        
//        [self.musicPlayer setQueueWithItemCollection: _userMediaItemCollection];
//        
//        [self.musicPlayer play];
//        
//        
//    } else  {
//        
//        BOOL wasPlaying = NO;
//        
//        if (self.musicPlayer.playbackState ==
//            MPMusicPlaybackStatePlaying) {
//            
//            wasPlaying = YES;
//            
//        }
//        
//        MPMediaItem *nowPlayingItem	= self.musicPlayer.nowPlayingItem;
//        
//        NSTimeInterval currentPlaybackTime	= self.musicPlayer.currentPlaybackTime;
//        
//        
//        NSMutableArray *currentSongsList= [[_userMediaItemCollection items] mutableCopy];
//        
//        NSArray *nowSelectedSongsList = [mediaItemCollection items];
//        
//        [currentSongsList addObjectsFromArray:nowSelectedSongsList];
//        
//        _userMediaItemCollection = [MPMediaItemCollection collectionWithItems:(NSArray *) currentSongsList];
//        
//        [self.musicPlayer setQueueWithItemCollection: _userMediaItemCollection];
//        
//        
//        self.musicPlayer.nowPlayingItem	= nowPlayingItem;
//        
//        self.musicPlayer.currentPlaybackTime = currentPlaybackTime;
//        
//        
//        if (wasPlaying) {
//            
//            [self.musicPlayer play];
//        }
//        
//        
//    }
//    
//    [_songTableView reloadData];
//    
//}
//    
//    
//- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker
//    {
//        [self dismissModalViewControllerAnimated:YES];
//    }
//    
//    
//#pragma mark PlayList View delegate methods
//    
//- (void)selectedPlayList:(MPMediaPlaylist*)playlist {
//    
//    
//    [self clearMusicList];
//    
//    [self updateTheMediaColledtionsItems:playlist];
//    
//}
//    
//#pragma mark -
//#pragma mark Table view data source
//    
//    
//    // Return the number of rows in the section.
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//    {
//        
//        return [_userMediaItemCollection.items count];
//        
//    }
//    
//    
//    // Customize the appearance of table view cells.
//    
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//        
//        static NSString *cellIdentifier = @"Cell";
//        
//        UITableViewCell   *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        
//        
//        if (cell == nil) {
//            
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//            
//            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
//        }
//        
//        
//        
//        MPMediaItem *anItem = (MPMediaItem *)[_userMediaItemCollection.items objectAtIndex: [indexPath row]];
//        
//        if (anItem) {
//            cell.textLabel.text = [anItem valueForProperty:MPMediaItemPropertyTitle];
//        }
//        
//        return cell;
//    }
//    
//    
//#pragma mark -
//#pragma mark Table view delegate
//    
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//        
//        if ([_userMediaItemCollection.items count] > 0) {
//            
//            MPMediaItem *selectedItem = (MPMediaItem *)[_userMediaItemCollection.items objectAtIndex:[indexPath row]];
//            
//            
//            [self.musicPlayer setNowPlayingItem:selectedItem];
//            
//            [self.musicPlayer play];
//            
//        }
//        
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        
//    }
//    
//    
//-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath
//    {
//        
//        return 20;    
//    }
//    
//    

    @end