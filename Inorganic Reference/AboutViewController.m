//
//  AboutViewController.m
//  Inorganic Reference
//
//  Created by lwxted on 12-10-5.
//  Copyright (c) 2012年 lwxted. All rights reserved.
//

#import "AboutViewController.h"
#import <Social/Social.h>

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![SLComposeViewController class]) {
        self.label.frame = CGRectMake(20, 262, 96, 21);
        self.tickButton.frame = CGRectMake(98, 257, 35, 35);
        //self.tickButton.frame = self.weiboButton.frame;
        [self.weiboButton removeFromSuperview];
        [self.twitterButton removeFromSuperview];
        [self.facebookButton removeFromSuperview];
        self.weiboButton = nil;
        self.twitterButton = nil;
        self.facebookButton = nil;
    }
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDismiss:nil];
    [self setWeiboButton:nil];
    [self setTickButton:nil];
    [self setFacebookButton:nil];
    [self setTwitterButton:nil];
    [self setLabel:nil];
    [super viewDidUnload];
}
- (IBAction)dismissed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)weibo:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        SLComposeViewController *fb = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        [fb setInitialText:@"发现一个 iOS 很强大的无机化学小软，记得一定去看看哦~ http://t.cn/zl18UsA @无机化学参考iOS"];
        [self presentModalViewController:fb animated:YES];
    }
}
- (IBAction)tick:(id)sender {
    NSString *myAppID = @"568380363";
    NSString* url = [NSString stringWithFormat:  @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", myAppID];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url]];
}

- (IBAction)facebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fb = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [fb setInitialText:@"发现一个 iOS 很强大的无机化学小软，记得一定去看看哦~ http://t.cn/zl18UsA @无机化学参考iOS"];
        [self presentModalViewController:fb animated:YES];
    }
}
- (IBAction)twitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *fb = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [fb setInitialText:@"发现一个 iOS 很强大的无机化学小软，记得一定去看看哦~ http://t.cn/zl18UsA @无机化学参考iOS"];
        [self presentModalViewController:fb animated:YES];
    }
}
@end
