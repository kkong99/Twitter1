//
//  ComposeViewController.m
//  twitter
//
//  Created by Kimora Kong on 7/5/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // [self setComposeView:_user];
    [[APIManager shared] getUser:^( NSDictionary *user, NSError *error) {
        NSLog(@"something");
        if(user){
            self.user = (User *)user;
            [self.profile setImageWithURL:[NSURL URLWithString:user[@"profile_image_url_https"]]];
            self.nameLabel.text = user[@"name"];
            self.screenname.text = [@"@" stringByAppendingString:user[@"screen_name"]];
        }
        else{
            NSLog(@"ERROR PROCESSING USER INFO IN COMPOSE");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)post:(id)sender {
    [[APIManager shared] postStatusWithText:self.tweetField.text completion:^(Tweet *tweet, NSError *error) {
        if (tweet){
            [self.delegate didTweet:tweet];
        } else {
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
    }];
    [self dismissViewControllerAnimated:true completion:nil];
     
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
