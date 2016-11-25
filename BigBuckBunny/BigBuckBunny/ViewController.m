//
//  ViewController.m
//  BigBuckBunny
//
//  Created by FineRui on 16/7/8.
//  Copyright © 2016年 FanRui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)playMovie:(id)sender
{
    UIButton *playButton = (UIButton *) sender;
    
    NSString *filepath = {[[NSBundle mainBundle] pathForResource:@"big-buck-bunny-clip" ofType:@"m4v"]};
    NSURL *fileURL = [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:fileURL];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayebackComplete) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayerController];
    [self.view addSubview:moviePlayerController.view];
    
    [moviePlayerController.view setFrame:CGRectMake(playButton.frame.origin.x, playButton.frame.origin.y, playButton.frame.size.width, playButton.frame.size.height)];
    
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}

-(void) moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayerController];
    [moviePlayerController.view removeFromSuperview];
 //   [moviePlayerController release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
