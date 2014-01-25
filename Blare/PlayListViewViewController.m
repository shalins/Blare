//
//  PlayListViewViewController.m
//  Blare
//
//  Created by Aakash on 1/25/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//


#import "PlayListViewViewController.h"

@interface PlayListView ()  {
    
    @private
    
    UITableView *_playListTableView;
    
    NSMutableArray *_playListArray;
}
    
- (void)getPlayList;
- (void)createPlayListTable;
- (void)createCloseButton;
    
    @end

@implementation PlayListView
    
    @synthesize playListViewDelegate = _playListViewDelegate;
    
- (id)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            
            
            [self getPlayList];
            [self createCloseButton];
            [self createPlayListTable];
            
        }
        return self;
    }
    
    
- (void)getPlayList {
    
    MPMediaQuery *playlistsQuery = [MPMediaQuery playlistsQuery];
    _playListArray = (NSMutableArray*)[playlistsQuery collections];
}
    
- (void)createPlayListTable {
    
    _playListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,30,320,430)];
	[_playListTableView setDelegate:self];
	[_playListTableView setDataSource:self];
    
    [self addSubview: _playListTableView];
    
}
    
    
- (void)createCloseButton {
    
    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [closeButton setFrame:CGRectMake(2,2,50,25)];
    
    [closeButton addTarget:self action:@selector(closePlayListView) forControlEvents:UIControlEventTouchUpInside];
    
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    
    [self addSubview: closeButton];
    
}
    
- (void)closePlayListView {
    
    [self removeFromSuperview];
}
    
#pragma mark -
#pragma mark Table view data source
    
    
    // Return the number of rows in the section.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        
        return [_playListArray count];
    }
    
    
    // appearance of table view cells.
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
        static NSString *cellIdentifier = @"Cell";
        
        UITableViewCell   *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        
        MPMediaPlaylist *playlist = [_playListArray objectAtIndex:[indexPath row]];
        
        NSString *playlistName = [playlist valueForProperty:MPMediaPlaylistPropertyName];
        
        cell.textLabel.text = playlistName;
        
        return cell;
        
    }
    
    
#pragma mark -
#pragma mark Table view delegate
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        
        if ([_playListArray count] > 0) {
            
            MPMediaPlaylist *selectedplaylist = [_playListArray objectAtIndex:[indexPath row]];
            
            
            if ([self.playListViewDelegate respondsToSelector:@selector(selectedPlayList:)]) {
                
                [self.playListViewDelegate selectedPlayList:selectedplaylist];
                
            }
            
            [self removeFromSuperview];
        }
        
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    
    
    
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*) indexPath 
    {
        
        return 30;    
    }
    
    
    
    
    
    
    @end