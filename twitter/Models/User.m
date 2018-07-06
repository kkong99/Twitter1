//
//  User.m
//  twitter
//
//  Created by Kimora Kong on 7/2/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "User.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation User

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        // self.profile =
        self.profile = [NSURL URLWithString:dictionary[@"profile_image_url_https"]];
        
    }
    return self; 

    
}

@end
