//
//  ViewController.m
//  MediaPlayer
//
//  Created by FineRui on 16/5/26.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)init{
    self = [super initWithNibName:@"ViewController" bundle:nil];
    if(self){
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Sound12" ofType:@"aif"];
        NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"周杰伦 - 红尘客栈" ofType:@"mp3"];
//        NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"Layers" ofType:@"m4v"];
//        NSString *avPath = [[NSBundle mainBundle] pathForResource:@"Layers" ofType:@"m4v"];
        if(soundPath) {
            NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
            OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(soundURL), &shortSound);
            if(err !=  kAudioServicesNoError) {
                NSLog(@"Could not load %@, error code: %d", soundURL,err);
            }
        }
        //对于压缩过的文件或者超过30s的音频文件，可以使用AVAudioPlayer类。
        if(musicPath) {
            NSURL *musicURL = [NSURL fileURLWithPath:musicPath];
            audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
            [audioPlayer setDelegate:self];
        }
/*
        if(moviePath) {
            NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
            moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:movieURL];
        }
        
        if(avPath) {
            NSURL *avURL = [NSURL fileURLWithPath:avPath];
        //    avPlayer = [[AVPlayerViewController alloc]ini
        }
 */
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self init];
    [self.view setBackgroundColor:[UIColor whiteColor]];
/*
    [[self view] addSubview:[moviePlayer view]];
    float halfHeight = [[self view] bounds].size.height/2.0;
    float width = [[self view] bounds].size.width;
    [[moviePlayer view] setFrame:CGRectMake(0, halfHeight, width, halfHeight)];
*/
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PlayShortSound:(id)sender {
    AudioServicesPlaySystemSound(shortSound);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)PlayAudioFile:(id)sender {
    if([audioPlayer isPlaying]) {
        [audioPlayer stop];
        [sender setTitle:@"Play Audio FIle" forState:UIControlStateNormal];
    } else {
        [audioPlayer play];
        [sender setTitle:@"Stop Audio File" forState:UIControlStateNormal];
    }
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [audioButton setTitle:@"Play Audio File" forState:UIControlStateNormal];
}

- (void) audioPlayerEndInterruption:(AVAudioPlayer *)player {
    [audioPlayer play];
}
@end
