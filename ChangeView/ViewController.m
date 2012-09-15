//
//  ViewController.m
//  ChangeView
//
//  Created by Ömer Avci on 15.09.12.
//  Copyright (c) 2012 Ömer Avci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL isShowingBanner;

@end

@implementation ViewController

- (IBAction)changeView:(id)sender {
    if (self.isShowingBanner) {
        UIView *existingView = self.view.subviews[0];
        
        CGRect existingViewFrame = existingView.frame;
        existingViewFrame.size.height += 50;
        existingView.frame = existingViewFrame;
        
        self.view = existingView;
        self.isShowingBanner = NO;
    } else {
        UIView *existingView = self.view;
        [existingView setBackgroundColor:[UIColor greenColor]];
        
        UIView *newView = [[UIView alloc] initWithFrame:existingView.frame];
        [newView setBackgroundColor:[UIColor redColor]];
        
        UIView *bannerView = [[UIView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 50), 320, 50)];
        [bannerView setBackgroundColor:[UIColor blueColor]];
        
        CGRect existingViewFrame = existingView.frame;
        existingViewFrame.size.height -= 50;
        existingView.frame = existingViewFrame;
        
        [newView addSubview:existingView];
        [newView addSubview:bannerView];
        
        self.view = newView;
        self.isShowingBanner = YES;
    }
}

@end
