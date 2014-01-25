//
//  HostViewController.h
//  Blare
//
//  Created by Aakash on 1/25/14.
//  Copyright (c) 2014 Spencer Yen. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PlayListViewViewController.h"

@interface HostViewController : UIViewController <MPMediaPickerControllerDelegate,PlayListViewDelegate>
    
    @end
