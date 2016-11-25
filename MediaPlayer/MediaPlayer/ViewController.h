//
//  ViewController.h
//  MediaPlayer
//
//  Created by FineRui on 16/5/26.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    IBOutlet UIButton *audioButton;

    SystemSoundID shortSound;
    AVAudioPlayer *audioPlayer;
 //   MPMoviePlayerController *moviePlayer;
 //   AVPlayerViewController *avPlayer;
}

- (IBAction)PlayShortSound:(id)sender;

- (IBAction)PlayAudioFile:(id)sender;

@end

