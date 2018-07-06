//
//  TweetCell.m
//  twitter
//
//  Created by Kimora Kong on 7/3/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    

    
    // self.loveImage = self.tweet.favorited;
}
- (void)setTweet:(Tweet *)tweet {
    _tweet = tweet;
    
    self.nameLabel.text = self.tweet.user.name;
    self.screenNameLabel.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.dateLabel.text = self.tweet.createdAtString;
    self.tweetLabel.text = self.tweet.text;
    self.loveNumber.text = [[NSNumber numberWithInt:self.tweet.favoriteCount] stringValue];
    self.retweetNumber.text = [[NSNumber numberWithInt:self.tweet.retweetCount] stringValue];
    [self.profileImage setImageWithURL:self.tweet.user.profile];

}

- (IBAction)didTapFavorite:(id)sender {
    
    
    if(self.tweet.favorited == YES){
        self.tweet.favorited = NO;
        self.love.selected = NO;
        self.tweet.favoriteCount -= 1;
        [self refreshData:self.tweet];
        
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }else{
        self.tweet.favorited = YES;
        self.love.selected = YES;
        self.tweet.favoriteCount += 1;
        [self refreshData:self.tweet];
        
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (IBAction)didTapRetweet:(id)sender {
    
    if(self.tweet.retweeted == YES){
        self.tweet.retweeted = NO;
        self.retweet.selected = NO;
        self.tweet.retweetCount -= 1;
        [self refreshData:self.tweet];
        
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }else{
        self.tweet.retweeted = YES;
        self.retweet.selected = YES;
        self.tweet.retweetCount += 1;
        [self refreshData:self.tweet];
        
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
}

- (void)refreshData:(Tweet*)tweet {
    [self setTweet:tweet];
}


@end
