//
//  TDAudioStreamerConstants.m
//  TDAudioStreamer
//
//  Created by Tony DiPasquale on 11/5/13.
//  Copyright (c) 2013 Tony DiPasquale. The MIT License (MIT).
//

#import "TDAudioStreamerConstants.h"

NSString *const TDAudioStreamerDidChangeAudioNotification = @"TDAudioStreamerDidChangeAudioNotification";
NSString *const TDAudioStreamerDidPauseNotification = @"TDAudioStreamerDidPauseNotification";
NSString *const TDAudioStreamerDidPlayNotification = @"TDAudioStreamerDidPlayNotification";
NSString *const TDAudioStreamerDidStopNotification = @"TDAudioStreamerDidStopNotification";

NSString *const TDAudioStreamerNextTrackRequestNotification = @"TDAudioStreamerNextTrackRequestNotification";
NSString *const TDAudioStreamerPreviousTrackRequestNotification = @"TDAudioStreamerPreviousTrackRequestNotification";

NSString *const TDAudioStreamDidFinishPlayingNotification = @"TDAudioStreamDidFinishPlayingNotification";
NSString *const TDAudioStreamDidStartPlayingNotification = @"TDAudioStreamDidStartPlayingNotification";

UInt32 const kTDAudioStreamReadMaxLength = 1000;
UInt32 const kTDAudioQueueBufferSize = 2548;
UInt32 const kTDAudioQueueBufferCount = 25;
UInt32 const kTDAudioQueueStartMinimumBuffers = 2;
