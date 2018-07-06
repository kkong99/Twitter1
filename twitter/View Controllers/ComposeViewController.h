//
//  ComposeViewController.h
//  twitter
//
//  Created by Kimora Kong on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIManager.h"

@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweetField;

@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;

- (IBAction)post:(id)sender;
- (IBAction)close:(id)sender;
@end
